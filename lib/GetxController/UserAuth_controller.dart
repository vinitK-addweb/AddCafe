import 'dart:io';
import 'package:addcafe/views/Auth/Signin.dart';

import '../views/Auth/Password.dart';
import 'package:addcafe/views/MyHomePage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:addcafe/views/Auth/Otp.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:addcafe/Utils/Global.dart';

class UserAuth extends GetxController {
  Rx<TextEditingController> textController = TextEditingController().obs;
  Rx<TextEditingController> otp = TextEditingController().obs;
  Rx<TextEditingController> password = TextEditingController().obs;
  Rx<TextEditingController> fullName = TextEditingController().obs;
  Rx<TextEditingController> email = TextEditingController().obs;
  Rx<TextEditingController> cPassword = TextEditingController().obs;
  Rx<TextEditingController> phone = TextEditingController().obs;

  bool isObscure = true;
  Map<String, dynamic> userprofile = {};

  Map<String, dynamic> _UserLogin = {};
  final data = [
    {"id": "2", "image": "assets/images/facebook.png", "name": "Burger"},
    {"id": "3", "image": "assets/images/google.webp", "name": "Cake"},
  ];

  // late final _token;

// <--------------------- User Sign Up Functionality --------------------->

  Future signUp() async {
    final headers = {"Content-type": "multipart/form-data"};
    Map mapedData = {
      "email": email.value.text,
      "password": password.value.text,
      "first_name": fullName.value.text,
      "mobile_number": phone.value.text.substring(2, 11)
    };

    http.Response response = await http.post(
        Uri.parse('${dotenv.env['API_URL']}/accounts/signup/'),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(mapedData));

    print(response);
    if (response.statusCode == 201) {
      _UserLogin = await jsonDecode(response.body);
      // _token = await _UserLogin['access'];
      userprofile = await _UserLogin['payload'];
      print('_userProfile: ${userprofile}');
      Get.to(() => Mylogin());
    }
  }

  // ---------------------------------Form Validation-------------------------------
  SignUpValidation() {
    Get.focusScope!.unfocus();
    print('fullName ');
    print(password.value.text);
    RegExp regex =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    if (email.value.text.isEmpty ||
        phone.value.text.isEmpty ||
        fullName.value.text.isEmpty ||
        password.value.text.isEmpty ||
        cPassword.value.text.isEmpty)
      'All Fields are Required'.showError();
    else if (password.value.text.length < 8)
      'Password should have atleast 8 characters'.showError();
    else if (!regex.hasMatch(password.value.text))
      'Enter a stronger password'.showError();
    else if (!GetUtils.isEmail(email.value.text))
      'Enter a Valid Email Address'.showError();
    else if (password.value.text != cPassword.value.text)
      'Confimation password does not match the entered password'.showError();
    else if (phone.value.text.length < 10)
      'Plase Enter a Valid Mobile Number'.showError();
    else
      'Done'.showSuccess();
  }

  // -------------------Continue to otp or password screen----------------------------------
  continueToPasswordOrOtp() {
    Get.focusScope!.unfocus();

    if (textController.value.text.isNotEmpty) {
      if (double.tryParse(textController.value.text) != null) {
        // this.mobile = textController.text;
        if (textController.value.text.length != 10)
          'Enter a Valid Mobile No.'.showError();
        else
          Get.to(Otp());
      } else {
        if (!GetUtils.isEmail(textController.value.text))
          'Enter a Valid Email Address'.showError();
        else {
          // this.email = textController.text;
          Get.to(Password());
          print("string");
        }
      }
    } else
      'Please Enter mobile No. Or Email'.showError();
  }
// <-----------------  User SignIn Functionality ------------------>

  Future signIn(login, context) async {
    if (double.tryParse(textController.value.text) != null) {
      // this.mobile = textController.text;
      print("number");
    } else {
      // this.email = textController.text;
      print("string");
    }
    ;

    // Map mapedData = {
    //   "mobile_number": this.mobile,
    // };
    // if (mobile != '') {
    //   // userAuth.signIn(mapedData, context);
    //   Navigator.pushNamed(context, '/Otp', arguments: this.mobile);
    // } else
    //   Navigator.pushNamed(context, '/Password', arguments: this.email);

    // final isValid = _formKey.currentState?.validate();

    // if (!isValid!) {
    //   return;
    // }
    // _formKey.currentState!.save();
    // print(await this.mobile);
    // // await Navigator.pushNamed(context, '/Otp', arguments: this.mobile);
    // await Navigator.pushNamed(context, mobile == '' ? '/Password' : '/Otp',
    //     arguments: mobile == '' ? this.email : this.mobile);

    SharedPreferences prefs = await SharedPreferences.getInstance();

    http.Response response = await http.post(
        Uri.parse('${dotenv.env['API_URL']}/accounts/login/'),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(login));

    if (response.statusCode == 200) {
      _UserLogin = Map<String, dynamic>.from(jsonDecode(response.body));
      Map<String, dynamic> dictPayload = _UserLogin['payload'];

      //  This is the issue
      final strPayLoad = jsonEncode(_UserLogin['payload']);
      prefs.setString('userData', strPayLoad);

      if (await _UserLogin.containsKey("access")) {
        // print('_userProfile: ${prefs.get('userData')}');

        prefs.setString('token', await _UserLogin['access']);
        print('sharedpreferences--------> ${prefs.getString('userData')}');
        getlocaStorage();
        await Navigator.pushNamed(context, '/');
      } else
        print('no token${userprofile}');

      // print(response.body);

    }
    // print(response.body);
  }

  getlocaStorage() async {
    Future.delayed(Duration(milliseconds: 1), () async {
      print('user auth========> ${userProfile} ');

      SharedPreferences prefs = await SharedPreferences.getInstance();

      var userDataPref = prefs.getString('userData');

      if (userDataPref != null) {
        try {
          userprofile =
              await Map<String, dynamic>.from(jsonDecode(userDataPref));
        } catch (error) {
          print(error);
        }
      } else {
        userprofile = {};
      }
    });
  }

  Future logOut(context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // await storage.deleteItem('userData');
    // userprofile = null;
    userprofile = {};
    prefs.remove('userData');
    prefs.remove('token');

    await Navigator.pushNamed(context, '/signin');
  }

  //  <-----------------  User Otp verification Functionality ------------------>
  Future MobileVerification() async {}

  // String get token {
  //   return _token;
  // }

  get userProfile {
    return userprofile;
  }

  Map get userData {
    // signIn();
    return _UserLogin;
  }
}
