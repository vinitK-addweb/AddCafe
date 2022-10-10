import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CartApi with ChangeNotifier {
  Map _cart = {};

  List _cartData = [];

  // getter
  Map get cart {
    return _cart;
  }

  List get cartData {
    return _cartData;
  }

  //action
  Future fetchCart() async {
    http.Response response;
//     Map header = { 'headers': {
// 'Content-Type': 'application/json',
// "Authorization" : Bearer ${token}
// }};
    response = await http.get(
        Uri.parse('https://cafe.addwebprojects.com/api/v1/cart/cart-items/'),
        headers: {
          "Content-Type": "application/json",
          "Authorization":
              'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjc0MDQwNjQ1LCJpYXQiOjE2NjU0MDA2NDUsImp0aSI6ImI0NDM0M2M3MDMyYTRhMWZiNzczNzAyZTJhMDkzYzMwIiwidXNlcl9pZCI6MX0.Hs1B5pTqMfP7h5DJT4JFI31Ze6gmeJgNCExVNCvEswo'
        });

    print(response.body);
    _cart = jsonDecode(response.body);
    _cartData = _cart['payload'];
    notifyListeners();
  }
}
