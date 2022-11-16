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

class UserProfileController extends GetxController {
  // Map<String, dynamic> userdetail = {};
  Rx<UserDetailsModel> userdetails = UserDetailsModel().obs;
  File? image;

  final picker = ImagePicker();
  // RxMap<dynamic, dynamic> userprofile = <dynamic, dynamic>{}.obs;
  getUserDetails() async {
    Future.delayed(Duration(milliseconds: 1), () async {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      // var userDataPref = prefs.getString('userData');

      // if (userDataPref != null) {

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
