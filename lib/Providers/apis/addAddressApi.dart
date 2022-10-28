import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AddaddressApi with ChangeNotifier {
  Map _savedAddress = {};
  List _savedAddressData = [];
  int _selectedAddress = 0;

  List get savedAddressData {
    return _savedAddressData;
  }

  int get selectedAddress {
    return _selectedAddress;
  }

//fetcching all saved address
  Future fetchSavedAddress() async {
    http.Response response;
    response = await http.get(
        Uri.parse(
            'https://cafe.addwebprojects.com/api/v1/order/saved-address/'),
        headers: {
          "Content-Type": "application/json",
          "Authorization":
              'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjc0MDQwNjQ1LCJpYXQiOjE2NjU0MDA2NDUsImp0aSI6ImI0NDM0M2M3MDMyYTRhMWZiNzczNzAyZTJhMDkzYzMwIiwidXNlcl9pZCI6MX0.Hs1B5pTqMfP7h5DJT4JFI31Ze6gmeJgNCExVNCvEswo'
        });
    if (response.statusCode == 200) {
      print('fetchSavedAddress called');
      _savedAddress = jsonDecode(response.body);
      _savedAddressData = _savedAddress['payload'];
      notifyListeners();
    } else {
      print('couldnt fetch all saved address');
    }
  }

  //adding new address
  Future addNewAddress(payload) async {
    http.Response response;
    response = await http.post(
        Uri.parse('https://cafe.addwebprojects.com/api/v1/order/address/'),
        headers: {
          "Content-Type": "application/json",
          "Authorization":
              'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjc0MDQwNjQ1LCJpYXQiOjE2NjU0MDA2NDUsImp0aSI6ImI0NDM0M2M3MDMyYTRhMWZiNzczNzAyZTJhMDkzYzMwIiwidXNlcl9pZCI6MX0.Hs1B5pTqMfP7h5DJT4JFI31Ze6gmeJgNCExVNCvEswo'
        },
        body: jsonEncode(payload));

    print('addNewAddress called');
    print(response.statusCode);
    print(response.body);
    fetchSavedAddress();
    // if (response.statusCode == 200) {
    //   notifyListeners();
    // } else {
    //   print(response.body);
    // }
  }

  Future deleteAddress(id) async {
    http.Response response;
    response = await http.delete(
        Uri.parse(
            'https://cafe.addwebprojects.com/api/v1/order/address/${id}/'),
        headers: {
          "Content-Type": "application/json",
          "Authorization":
              'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjc0MDQwNjQ1LCJpYXQiOjE2NjU0MDA2NDUsImp0aSI6ImI0NDM0M2M3MDMyYTRhMWZiNzczNzAyZTJhMDkzYzMwIiwidXNlcl9pZCI6MX0.Hs1B5pTqMfP7h5DJT4JFI31Ze6gmeJgNCExVNCvEswo'
        });
    fetchSavedAddress();
  }

  //selecting an address on addadderss page
  setAddress(addressId) {
    _selectedAddress = addressId;
    notifyListeners();
  }
}
