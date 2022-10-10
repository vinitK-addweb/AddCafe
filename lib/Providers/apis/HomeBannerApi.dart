import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomeBannerApi with ChangeNotifier {
  List _homeBannerData = [];

  List get homeBannerData {
    getHomeBanner();
    return [..._homeBannerData];
  }

  Future getHomeBanner() async {
    http.Response response;
    response = await http.get(Uri.parse(
        'https://cafe.addwebprojects.com/api/v1/promotion/active-banner/'));
    if (response.statusCode == 200) {
      // setState(() {
      _homeBannerData = json.decode(response.body);
      // });
      print('runnnnn');
    } else {
      print('not running');
    }
  }
}
