import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class UserAuth with ChangeNotifier {
  var _userProfile = null;

  Map _UserLogin = {};

  String _token = '';

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
}
