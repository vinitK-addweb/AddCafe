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
import '../Utils/Global.dart';
import '../Views/userProfile.dart';

class UserProfileController extends GetxController {
  Rx<UserDetailsModel> userdetails = UserDetailsModel().obs;
  RxList<UserAddressModel> addAddress = <UserAddressModel>[].obs;
  Rx<TextEditingController> currentPassword = TextEditingController().obs;
  Rx<TextEditingController> newPassword = TextEditingController().obs;
  Rx<TextEditingController> phoneNumber = TextEditingController().obs;
  Rx<TextEditingController> textController = TextEditingController().obs;
  Rx<TextEditingController> buildingNameNo = TextEditingController().obs;
  Rx<TextEditingController> area = TextEditingController().obs;
  Rx<TextEditingController> landMark = TextEditingController().obs;
  Rx<TextEditingController> city = TextEditingController().obs;
  Rx<TextEditingController> state = TextEditingController().obs;
  Rx<TextEditingController> pinCode = TextEditingController().obs;
  Rx<TextEditingController> addressType = TextEditingController().obs;

  Map<String, dynamic> _changePass = {};

  RxMap<dynamic, dynamic> userprofile = <dynamic, dynamic>{}.obs;
  Rx<File> image = File("").obs;

  final picker = ImagePicker();

  // ------------------ Update Profile image ------------------------------------>

  updateProfileImage() async {
    // final params = {'profile_picture': image.value};

    var response = await API.instance.postImage(
        endPoint: 'accounts/customer-profile/',
        params: {},
        fileParams: 'profile_picture',
        file: image.value);
    debugPrint('image path===============> ');
    getUserDetails();
  }

  //  ----------------- Get User details from local storage --------------------->
  getUserDetails() async {
    Future.delayed(Duration(milliseconds: 1), () async {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      userprofile.value = await API.instance
          .get(endPoint: 'accounts/customer-profile/', isHeader: true);
      print("runing=========>>>>>>>>>>>>>>>>>>");
      //  RxMap<dynamic, dynamic>.from(
      //     jsonDecode(prefs.getString('userData').toString()));
      getAddress();
      update();
    });
  }

  // --------------------- fetch user saved address--------------------------->
  getAddress() async {
    print("getAddress=======>>>>>>> 123");
    final response = await API.instance
        .get(endPoint: 'order/saved-address/', isHeader: true);
    // print("getAddress=======>>>>>>>" + response);
    addAddress.value = List<UserAddressModel>.from(
        response['payload'].map((x) => UserAddressModel.fromJson(x)));
  }
  // --------------------------- Add New Address ------------------------->

  addNewAddress() async {
    final addressData = {
      "user": "1",
      "phone_num": phoneNumber.value.text,
      "building_num_name": buildingNameNo.value.text,
      "area_colony": area.value.text,
      "landmark": landMark.value.text,
      "pincode": pinCode.value.text,
      "city": city.value.text,
      "state": state.value.text,
      "address_type": addressType.value.text
    };

    debugPrint(addressData.toString());
    var response = API.instance
        .post(endPoint: 'order/address/', params: addressData, isHeader: true);

    // var data = response;

    getAddress();
    update();
    // await Get.to(UserProfile());
    Get.back();
  }

  addresTypeFunction(value) {
    addressType.value.text = value;
  }

  // --------------------------- fetch Address By id  ------------------------->
  fetchAddressByid(id) async {
    // print("order data is here==========>>>>>" + id.toString());
    final response =
        await API.instance.get(endPoint: 'order/address/$id/', isHeader: true);

    // print("order data is here==========>>>>>" + response['id']);
  }

  // --------------------------- update User Address ------------------------->

  updateAddress() {
    // phoneNumber.value =
  }

  // --------------------------- Delete User Address ------------------------->
  deleteAddress(id) async {
    final response = await API.instance
        .delete(endPoint: 'order/address/${id}/', isHeader: true);
    await getUserDetails();

    if (response!['status'] == 204) {
      '${response['message']}'.showSuccess();
    }
  }

  // --------------------------- change password  ------------------------->

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
      "email": userprofile.value['email'],
      // userdetails.value.email,
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

    if (_changePass != null) {
      currentPassword.value.text = '';
      newPassword.value.text = '';
    }
  }

  addAddressValidation(value) {
    if (value == null || value.isEmpty) {
      return 'Please enter some text';
    } else {
      return null;
    }
  }
}
