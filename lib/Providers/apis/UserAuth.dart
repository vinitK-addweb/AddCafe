import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class UserAuth with ChangeNotifier {
  var _userProfile = null;

  Map _UserLogin = {};

  String _token = '';

  String _isPasswordUpdated = '';

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
      _userProfile = await _UserLogin['payload'];
      print('_userProfile: ${_userProfile}');
      notifyListeners();

      Navigator.pushNamed(context, '/signin');
    }
  }

  Future signIn(login, context) async {
    // final headers = {"Content-type": "multipart/form-data"};

    http.Response response = await http.post(
        Uri.parse('${dotenv.env['API_URL']}/accounts/login/'),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(login));
    print(response.body);
    if (response.statusCode == 200) {
      _UserLogin = await jsonDecode(response.body);
      _token = await _UserLogin['access'];
      _userProfile = await _UserLogin['payload'];
      print('_userProfile: ${_userProfile}');
      notifyListeners();

      Navigator.pushNamed(context, '/');
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
  }

  get userProfile {
    return _userProfile;
  }

  Map get userData {
    // signIn();
    return _UserLogin;
  }

  String get isPasswordUpdated {
    return _isPasswordUpdated;
  }
}
