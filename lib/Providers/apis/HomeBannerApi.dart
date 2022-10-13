import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class HomeBannerApi with ChangeNotifier {
  List _homeBannerData = [];

  List get homeBannerData {
    return [..._homeBannerData];
  }

  Future fetchHomeBanner() async {
    http.Response response;
    response = await http
        .get(Uri.parse('${dotenv.env['API_URL']}/promotion/active-banner/'));
    if (response.statusCode == 200) {
      // setState(() {
      _homeBannerData = json.decode(response.body);
      // });
      print('fetchHomeBanner called');
    } else {}
  }
}
