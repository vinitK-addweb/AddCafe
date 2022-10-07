import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomeCategoryApi with ChangeNotifier {
  List _homeCategoryData = [];

  Future getHomeCategory() async {
    http.Response response;
    response = await http.get(Uri.parse(
        'https://cafe.addwebprojects.com/api/v1/catalogue/active-category/'));
    if (response.statusCode == 200) {
      // setState(() {
      _homeCategoryData = json.decode(response.body);
      // });
      print('runnnnn');
    } else {
      print('not running');
    }
  }

  List get homeCategoryData {
    getHomeCategory();
    return [..._homeCategoryData];
  }
}
