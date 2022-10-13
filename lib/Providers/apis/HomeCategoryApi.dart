import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class HomeCategoryApi with ChangeNotifier {
  List _homeCategoryData = [];

  List get homeCategoryData {
    return [..._homeCategoryData];
  }

  Future fetchHomeCategory() async {
    http.Response response;
    response = await http
        .get(Uri.parse('${dotenv.env['API_URL']}/catalogue/active-category/'));
    if (response.statusCode == 200) {
      // setState(() {
      _homeCategoryData = json.decode(response.body);
      // });
      print('fetchHomeCategory called');
    } else {}
  }
}
