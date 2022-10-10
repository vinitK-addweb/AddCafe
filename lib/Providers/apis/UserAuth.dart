import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class UserAuth with ChangeNotifier {
  List _UserData = [];

  Future signUp(demo) async {
    // http.Response response;
    // response =
    //     await http.get(Uri.parse('${dotenv.env['API_URL']}/accounts/signup/'));
    // try {
    final headers = {"Content-type": "multipart/form-data"};
    // print('Json map data : ${demo}');

    http.Response response = await http.post(
        Uri.parse('${dotenv.env['API_URL']}/accounts/signup/'),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(demo));
    print(response.body);
    // switch (response.statusCode) {
    //   case 201:
    //     final data = json.decode(response.body);
    //     return Navigator.pushNamed(context, '/Otp',
    //         arguments: demo.mapedData.mobile);
    //     ;
    // }
    // print('Status code: ${response.statusCode}');
    // print('Body: ${response.body}');

    // if (response.statusCode == 201) {
    //   // setState(() {
    //   _UserData = json.decode(response.body);
    //   // });
    //   print('runnnnn');
    //   print('Body: ${response.body}');
    // } else {
    //   print('not running');
    // }
  }

  // List get homeCategoryData {
  //   signUp();
  //   return [
  //     ..._UserData,
  //   ];
  // }
}
