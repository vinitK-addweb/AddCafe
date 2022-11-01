import 'dart:io';
// import 'package:localstorage/localstorage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:addcafe/Providers/apis/MyfavouritesApi.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserAuth with ChangeNotifier {
  // final LocalStorage storage = new LocalStorage('token_access');
  //  SharedPreferences  prefs = await SharedPreferences.getInstance();
  // late var userprofile = null;
  Map<String, dynamic> userprofile = {};

  Map<String, dynamic> _UserLogin = {};

  // late final _token;


  String _isPasswordUpdated = '';


// <--------------------- User Sign Up Functionality --------------------->

  Future signUp(demo, context) async {
    final headers = {"Content-type": "multipart/form-data"};

    http.Response response = await http.post(
        Uri.parse('${dotenv.env['API_URL']}/accounts/signup/'),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(demo));

    print(response);
    if (response.statusCode == 201) {
      _UserLogin = await jsonDecode(response.body);
      // _token = await _UserLogin['access'];
      userprofile = await _UserLogin['payload'];
      print('_userProfile: ${userprofile}');
      notifyListeners();

      Navigator.pushNamed(context, '/signin');
    }
  }

// <-----------------  User SignIn Functionality ------------------>
  Future signIn(login, context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    http.Response response = await http.post(
        Uri.parse('${dotenv.env['API_URL']}/accounts/login/'),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(login));
    // print('workingggggggggggggggggg${login}');
    if (response.statusCode == 200) {
      _UserLogin = Map<String, dynamic>.from(jsonDecode(response.body));
      Map<String, dynamic> dictPayload = _UserLogin['payload'];

      // print(dictPayload['password']);
      // dictPayload['password'] = '';

      //  This is the issue
      final strPayLoad = jsonEncode(_UserLogin['payload']);
      prefs.setString('userData', strPayLoad);

      if (await _UserLogin.containsKey("access")) {
        // print('_userProfile: ${prefs.get('userData')}');

        prefs.setString('token', await _UserLogin['access']);
        print('sharedpreferences--------> ${prefs.getString('userData')}');
        getlocaStorage();
        await Navigator.pushNamed(context, '/');
        // print("tokennnnnnnnnnnn");
      } else
        print('no token${userprofile}');

      // print(response.body);

      notifyListeners();
    }
    // print(response.body);
  }


  Future changePassword(payload) async {
    http.Response response;
    response = await http.post(
        Uri.parse(
            'https://cafe.addwebprojects.com/api/v1/accounts/change-password/'),
        headers: {
          "Content-Type": "application/json",
          "Authorization":
              'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjc0MDQwNjQ1LCJpYXQiOjE2NjU0MDA2NDUsImp0aSI6ImI0NDM0M2M3MDMyYTRhMWZiNzczNzAyZTJhMDkzYzMwIiwidXNlcl9pZCI6MX0.Hs1B5pTqMfP7h5DJT4JFI31Ze6gmeJgNCExVNCvEswo'
        },
        body: jsonEncode(payload));

    print(response.statusCode);
    // print(response.body);
    var data = jsonDecode(response.body);
    _isPasswordUpdated = data['message'];
    notifyListeners();
  }

  String get token {
    return _token;

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
    notifyListeners();

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

  String get isPasswordUpdated {
    return _isPasswordUpdated;
  }
}
