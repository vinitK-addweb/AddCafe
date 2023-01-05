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
import 'package:http/http.dart' as http;

import '../Views/AddNewAddress.dart';
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
  RxInt address = 0.obs;
  RxInt AddUpdateid = 0.obs;
  RxBool showPassField = false.obs;
  RxBool showAddress = false.obs;

  Map<String, dynamic> _changePass = {};

  RxMap<dynamic, dynamic> userprofile = <dynamic, dynamic>{}.obs;
  Rx<File> image = File("").obs;
  final profile = Get.put(UserAuth());
  final picker = ImagePicker();

  initprofile() {
    Future.delayed(Duration(milliseconds: 10), () {
      getUserDetails();
      getAddress();
    });
  }

  // ------------------ Update Profile image ------------------------------------>
  updateProfileImage() async {
    print("img print");
    print(image.value.path.isEmpty);
    final params = {
      '_method': 'post',
    };

    final response = await API.instance.postImage(
      endPoint: "accounts/customer-profile/",
      params: params,
      fileParams: "profile_picture",
      file: image.value,
    );

    if (response!.isNotEmpty) {
      profile.signIn();
      // getUserDetails();
      "Profile picture uploaded".showSuccess();
    }
  }

  //  ----------------- Get User details from local storage --------------------->
  getUserDetails() async {
    print("object===============>>>>>>>>>>>");
    Future.delayed(Duration(milliseconds: 1), () async {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      userprofile.value = await API.instance
          .get(endPoint: 'accounts/customer-profile/', isHeader: true);
      print("runing=========>>>>>>>>>>>>>>>>>> ${userprofile.value}");
      //  RxMap<dynamic, dynamic>.from(
      //     jsonDecode(prefs.getString('userData').toString()));
      getAddress();
      // update();
    });
  }

  // --------------------- fetch user saved address--------------------------->
  getAddress() async {
    final response = await API.instance
        .get(endPoint: 'order/saved-address/', isHeader: true);

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

  // clear the edit address fields

  clearEdit() async {
    phoneNumber.value.text = "";

    buildingNameNo.value.text = "";
    area.value.text = "";
    landMark.value.text = "";
    pinCode.value.text = "";
    city.value.text = "";
    state.value.text = "";
    addressType.value.text = "";
  }

  // --------------------------- fetch Address By id  ------------------------->
  fetchAddressByid(idx) async {
    // print(addAddress[id].buildingNumName);

    phoneNumber.value.text = addAddress[idx].phoneNum!;

    buildingNameNo.value.text = addAddress[idx].buildingNumName!;
    area.value.text = addAddress[idx].areaColony!;
    landMark.value.text = addAddress[idx].landmark!;
    pinCode.value.text = addAddress[idx].pincode.toString();
    city.value.text = addAddress[idx].city!;
    state.value.text = addAddress[idx].state!;
    addressType.value.text = addAddress[idx].addressType!;

    print(addressType.value);
    Get.to(AddNewAddress(
      isAddress: false,
    ));
  }

  // --------------------------- update User Address ------------------------->

  updateAddress() {
    "hello".showSuccess();
    // phoneNumber.value =
    print("object = = = = = = == = == = = == == = = =>");
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

    var response = API.instance.patch(
        endPoint: '/order/address/$AddUpdateid/',
        params: addressData,
        isHeader: true);
    getAddress();
    update();
    Get.to(UserProfile());
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
