import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UserOrderApi with ChangeNotifier {
  List _userOrder = [];

  List get userOrder {
    return _userOrder;
  }

  Future fetchUserOrder() async {
    http.Response response;
    response = await http.get(
        Uri.parse('https://cafe.addwebprojects.com/api/v1/order/user-order/'),
        headers: {
          "Content-Type": "application/json",
          "Authorization":
              'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjc0MDQwNjQ1LCJpYXQiOjE2NjU0MDA2NDUsImp0aSI6ImI0NDM0M2M3MDMyYTRhMWZiNzczNzAyZTJhMDkzYzMwIiwidXNlcl9pZCI6MX0.Hs1B5pTqMfP7h5DJT4JFI31Ze6gmeJgNCExVNCvEswo'
        });
    if (response.statusCode == 200) {
      _userOrder = jsonDecode(response.body);
      print('fetchUserOrder called');
      notifyListeners();
    }
  }
}
