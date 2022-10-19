import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'dart:convert';

class FaqApi with ChangeNotifier {
  List _faqData = [];

  List get getFaqData {
    return [..._faqData];
  }

  Future fetchFaqData() async {
    http.Response response;
    response = await http.get(Uri.parse('${dotenv.env['API_URL']}/about/faq/'));
    if (response.statusCode == 200) {
      _faqData = json.decode(response.body);
      notifyListeners();

      print('fetchFaqData called ');
    }
  }
}
