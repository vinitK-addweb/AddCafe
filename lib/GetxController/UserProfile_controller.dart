import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:get/get.dart';
import 'dart:io';
import 'dart:async';
import '../GetxController/UserAuth_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../Utils/API.dart';
import '../Utils/Global.dart';
import '../Models/Model_UserDetails.dart';
import '../Models/Model_AddAddress.dart';

class UserProfileController extends GetxController {
  // Map<String, dynamic> userdetail = {};
  Rx<TextEditingController> currentPassword = TextEditingController().obs;
  Rx<TextEditingController> newPassword = TextEditingController().obs;
  Rx<UserDetailsModel> userdetails = UserDetailsModel().obs;
  Map<String, dynamic> _changePass = {};
  Rx<UserAddressModel> addAddress = UserAddressModel().obs;
  File? image;

  final picker = ImagePicker();

  initFunction() {
    getUserDetails();
    // getAddress();
  }

  // RxMap<dynamic, dynamic> userprofile = <dynamic, dynamic>{}.obs;
  getUserDetails() async {
    Future.delayed(Duration(milliseconds: 1), () async {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      var userprofile = RxMap<dynamic, dynamic>.from(
          jsonDecode(prefs.getString('userData').toString()));

      final response = await API.instance.get(
          endPoint: 'accounts/user/${userprofile['id']}/',
          isHeader: true) as Map<String, dynamic>;

      userdetails.value = UserDetailsModel.fromJson(response);

      //   } else {
      //     userprofile = {}.obs;
      //   }
    });
  }

  changePasswordValidation() {
    RegExp regex =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    if (newPassword.value.text.isEmpty || currentPassword.value.text.isEmpty)
      'All Fields are Required'.showError();
    else if (newPassword.value.text.length < 8)
      'Password should have atleast 8 characters'.showError();
    else if (!regex.hasMatch(newPassword.value.text))
      'Enter a stronger password'.showError();
    else
      changePassword();
  }

  changePassword() async {
    final mapedData = {
      "email": userdetails.value.email,
      "old_password": currentPassword.value.text,
      "new_password": newPassword.value.text
    };
    print(mapedData);
    _changePass = await API.instance.post(
        endPoint: 'accounts/change-password/',
        params: mapedData,
        isHeader: true) as Map<String, dynamic>;
    if (_changePass['status'] == 202) {
      '${_changePass['message']}'.showSuccess();
    }
    // 'password Change Sucessfully'.showSuccess();
    if (_changePass != null) {
      currentPassword.value.text = '';
      newPassword.value.text = '';
    }
  }

  getAddress() async {
    final response =
        await API.instance.get(endPoint: 'order/saved-address/', isHeader: true)
            as Map<String, dynamic>;
    addAddress.value = UserAddressModel.fromJson(response);
    print('${addAddress.value.payload![0].city}');
  }

  Future getImage() async {
    // ignore: deprecated_member_use
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    image = File(pickedFile!.path);
  }

  addAddressValidation(value) {
    if (value == null || value.isEmpty) {
      return 'Please enter some text';
    } else {
      return null;
    }
  }
}
