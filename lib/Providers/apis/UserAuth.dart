import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class UserAuth with ChangeNotifier {
  List _UserData = [];

  Map _UserLogin = {};

  String _token = '';

  Future signUp(demo) async {
    final headers = {"Content-type": "multipart/form-data"};

    http.Response response = await http.post(
        Uri.parse('${dotenv.env['API_URL']}/accounts/signup/'),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(demo));
    print(response.body);
  }

  Future signIn(login, context) async {
    // final headers = {"Content-type": "multipart/form-data"};

    http.Response response = await http.post(
        Uri.parse('${dotenv.env['API_URL']}/accounts/login/'),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(login));

    if (response.statusCode == 200) {
      _UserLogin = jsonDecode(response.body);
      _token = _UserLogin['access'];
      print('token data: ${_token}');
      notifyListeners();

      Navigator.pushNamed(context, '/');
    }
    // print(response.body);
  }

  String get token {
    return _token;
  }

  Map get userData {
    // signIn();
    return _UserLogin;
  }
}
