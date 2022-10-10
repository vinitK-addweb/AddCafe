import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class HomeBannerApi with ChangeNotifier {
  List _homeBannerData = [];

  List get homeBannerData {
    getHomeBanner();
    return [..._homeBannerData];
  }

  Future getHomeBanner() async {
    http.Response response;
    response = await http
        .get(Uri.parse('${dotenv.env['API_URL']}/promotion/active-banner/'));
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
