import 'dart:io';
import 'dart:convert';
import 'dart:developer';
import '../Utils/API.dart';
import 'package:get/get.dart';
import '../BottomNavBar.dart';
import 'Cart_controller.dart';
import '../Utils/Global.dart';
import '../Utils/Constant.dart';
import '../Views/Auth/Otp.dart';
import '../Views/Auth/Signin.dart';
import '../Views/Auth/Password.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserAuth extends GetxController {
  Rx<TextEditingController> textController = TextEditingController().obs;
  Rx<TextEditingController> otp = TextEditingController().obs;
  Rx<TextEditingController> password = TextEditingController().obs;
  Rx<TextEditingController> cassword = TextEditingController().obs;
  Rx<TextEditingController> firstName = TextEditingController().obs;
  Rx<TextEditingController> lastName = TextEditingController().obs;
  Rx<TextEditingController> email = TextEditingController().obs;
  Rx<TextEditingController> cPassword = TextEditingController().obs;
  Rx<TextEditingController> phone = TextEditingController().obs;
  RxMap<dynamic, dynamic> userprofile = <dynamic, dynamic>{}.obs;

  Map<String, dynamic> _UserLogin = {};
  RxBool isObscure = true.obs;
  final data = [
    {"id": "2", "image": "assets/images/facebook.png", "name": "Burger"},
    {"id": "3", "image": "assets/images/google.webp", "name": "Cake"},
  ];
  final cartApi = Get.put(CartController());

  initCustom() {
    Future.delayed(const Duration(microseconds: 1), () {
      getlocaStorage();
    });
  }

  // ---------------------------------Form Validation-------------------------------
  SignUpValidation() {
    Get.focusScope!.unfocus();

    RegExp regex =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    if (email.value.text.isEmpty ||
        phone.value.text.isEmpty ||
        firstName.value.text.isEmpty ||
        password.value.text.isEmpty) {
      'All Fields are Required'.showError();
    } else if (password.value.text.length < 8) {
      'Password should have atleast 8 characters'.showError();
    } else if (!regex.hasMatch(password.value.text)) {
      'Enter a stronger password'.showError();
    } else if (!GetUtils.isEmail(email.value.text)) {
      'Enter a Valid Email Address'.showError();
    } else if (phone.value.text.length < 10) {
      'Plase Enter a Valid Mobile Number'.showError();
    } else {
      'You Registered Successfully'.showSuccess();
      signUp();
    }
  }

  // -------------------Continue to otp or password screen----------------------------------
  continueToPasswordOrOtp() {
    Get.focusScope!.unfocus();

    if (textController.value.text.isNotEmpty) {
      if (double.tryParse(textController.value.text) != null) {
        if (textController.value.text.length != 10) {
          'Enter a Valid Mobile No.'.showError();
        } else {
          Get.to(Otp());
        }
      } else {
        if (!GetUtils.isEmail(textController.value.text)) {
          'Enter a Valid Email Address'.showError();
        } else {
          Get.to(Password(
            type: 'loginPass',
          ));
        }
      }
    } else {
      'Please Enter mobile No. Or Email'.showError();
    }
  }

// <--------------------- User Sign Up Functionality --------------------->

  Future signUp() async {
    final mapedData = {
      "email": email.value.text,
      "password": password.value.text,
      "first_name": firstName.value.text,
      "last_name": lastName.value.text,
      "mobile_number": phone.value.text
    };

    _UserLogin = await API.instance.post(
        endPoint: APIEndPoints.instance.kSignup,
        params: mapedData,
        isHeader: false) as Map<String, dynamic>;

    if (_UserLogin['status'] == 401) {
      '${_UserLogin['message']}'.showError();
    } else {
      resetFunction();
      Get.to(Mylogin());
    }
  }

// <-----------------  User SignIn Functionality ------------------>

  Future signIn() async {
    if (password.value.text.isNotEmpty) {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      final mapedData = {
        "email": textController.value.text,
        "password": password.value.text,
      };

      _UserLogin = await API.instance.post(
          endPoint: APIEndPoints.instance.kLogin,
          params: mapedData,
          isHeader: false) as Map<String, dynamic>;

      if (_UserLogin['status'] == 401) {
        '${_UserLogin['message']}'.showError();
      } else {
        // -------------------- Save data to the local storage------------------------

        final strPayLoad = jsonEncode(_UserLogin['payload']);
        prefs.setString('userData', strPayLoad);
        prefs.setString('token', await _UserLogin['access']);
        getlocaStorage();
        await Get.to(BottamNavigationBar());
      }
    }
  }

  // ---------------------- get data from local storage function---------------------
  getlocaStorage() async {
    Future.delayed(const Duration(milliseconds: 1), () async {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      var userDataPref = prefs.getString('userData');

      if (userDataPref != null) {
        try {
          kTOKENSAVED = prefs.getString('token') as String;

          userprofile = RxMap<dynamic, dynamic>.from(jsonDecode(userDataPref));
        } catch (error) {}
      } else {
        userprofile = {}.obs;
      }
      update();
    });
  }

// ------------------------ User Logout Function --------------------------->

  Future logOut() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    password.value.text = '';
    textController.value.text = '';
    kTOKENSAVED = '';
    userprofile = {}.obs;
    resetFunction();
    prefs.remove('userData');
    prefs.remove('token');
    cartApi.cartData.value = [];
    getlocaStorage();
    await Get.to(Mylogin());
  }

  // reset the variables
  resetFunction() {
    textController.value.text = '';
    firstName.value.text = '';
    lastName.value.text = '';
    password.value.text = '';
    cPassword.value.text = '';

    email.value.text = '';
    phone.value.text = '';
  }

  //  <-----------------  User Otp verification Functionality ------------------>
  Future MobileVerification() async {}

  obscure() {
    isObscure.value = !isObscure.value;
  }

  Future forgetPassword() async {
    final mapedData = {"email": textController.value.text};
    final resposne = await API.instance.post(
        endPoint: "accounts/send-password-reset-code/",
        params: mapedData,
        isHeader: false) as Map<String, dynamic>;
    if (resposne['status'] == 202) {
      '${resposne['message']}'.showSuccess();
      Get.to(Otp());
      // textController.value.text = '';
    }
  }

  verifyOtp() async {
    final params = {'email': textController.value.text, 'code': otp.value.text};

    log(params.toString());
    final otpData = await API.instance.post(
        endPoint: 'accounts/verify-reset-code/',
        params: params,
        isHeader: false);

    if (otpData!['status'] == 200) {
      Get.to(Password(
        type: 'resetPass',
      ));
    }
  }

  verifyPasswordReset() async {
    log("verifyPasswordReset runs");
    final param = {
      "email": 'vinit@addwebsolution.in',
      "code": otp.value.text,
      "password": password.value.text
    };
    log(param.toString());
    final data = await API.instance.post(
        endPoint: 'accounts/verify-password-reset/',
        params: param,
        isHeader: false);

    if (data == null) {
      resetFunction();
      'Somthing went wrong'.showError();
    }
    // log('reset pass data=========>>> ${data}');

    // Get.to(Mylogin());
  }

  get userProfile {
    return userprofile;
  }

  Map get userData {
    return _UserLogin;
  }
}
