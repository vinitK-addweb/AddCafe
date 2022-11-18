import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'dart:convert';

class CartController extends GetxController {
  Map _cart = {};

  List cartData = [];

  // getter
  Map get cart {
    return _cart;
  }

  // List get cartData {
  //   return _cartData;
  // }

  //action

  //get api call for cartproduct
  Future fetchCart() async {
    http.Response response;
    response = await http.get(
        Uri.parse('https://cafe.addwebprojects.com/api/v1/cart/cart-items/'),
        headers: {
          "Content-Type": "application/json",
          "Authorization":
              'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjc0MDQwNjQ1LCJpYXQiOjE2NjU0MDA2NDUsImp0aSI6ImI0NDM0M2M3MDMyYTRhMWZiNzczNzAyZTJhMDkzYzMwIiwidXNlcl9pZCI6MX0.Hs1B5pTqMfP7h5DJT4JFI31Ze6gmeJgNCExVNCvEswo'
        });

    _cart = jsonDecode(response.body);
    cartData = _cart['payload'];
    print('fetchCart called');
  }

  Future addToCart(payload) async {
    http.Response response;
    response = await http.post(
        Uri.parse(
            'https://cafe.addwebprojects.com/api/v1/cart/add-cart-items/'),
        headers: {
          "Content-Type": "application/json",
          "Authorization":
              'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjc0MDQwNjQ1LCJpYXQiOjE2NjU0MDA2NDUsImp0aSI6ImI0NDM0M2M3MDMyYTRhMWZiNzczNzAyZTJhMDkzYzMwIiwidXNlcl9pZCI6MX0.Hs1B5pTqMfP7h5DJT4JFI31Ze6gmeJgNCExVNCvEswo'
        },
        body: jsonEncode(payload));
    if (response.statusCode == 200) {
      fetchCart();
    }
  }
  // <------------------- update item from cart ----------------->

  Future updateQuantity(status, id) async {
    http.Response response;
    response = await http.patch(
        Uri.parse(
            'https://cafe.addwebprojects.com/api/v1/cart/cart-items/${id}/'),
        headers: {
          "Content-Type": "application/json",
          "Authorization":
              'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjc0MDQwNjQ1LCJpYXQiOjE2NjU0MDA2NDUsImp0aSI6ImI0NDM0M2M3MDMyYTRhMWZiNzczNzAyZTJhMDkzYzMwIiwidXNlcl9pZCI6MX0.Hs1B5pTqMfP7h5DJT4JFI31Ze6gmeJgNCExVNCvEswo'
        },
        body: jsonEncode({"quantity": status}));
    if (response.statusCode == 200) {
      fetchCart();
    } else {}
  }

  // <------------------- Delete item from cart ----------------->
  Future delete(id) async {
    http.Response response;
    response = await http.delete(
        Uri.parse(
            'https://cafe.addwebprojects.com/api/v1/cart/cart-items/${id}/'),
        headers: {
          "Content-Type": "application/json",
          "Authorization":
              'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjc0MDQwNjQ1LCJpYXQiOjE2NjU0MDA2NDUsImp0aSI6ImI0NDM0M2M3MDMyYTRhMWZiNzczNzAyZTJhMDkzYzMwIiwidXNlcl9pZCI6MX0.Hs1B5pTqMfP7h5DJT4JFI31Ze6gmeJgNCExVNCvEswo'
        });
    fetchCart();
  }

  List isInCart(id) {
    List data = cartData;
    var b = data.where((e) => e['item'] == id).toList();
    return b;
  }
}
