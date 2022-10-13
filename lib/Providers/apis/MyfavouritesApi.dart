import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class MyFavouritesApi with ChangeNotifier {
  List _myFavourites = [];

  List get myFavouritesData {
    // getMyFavourites();
    return [..._myFavourites];
  }

  Future fetchMyFavourites() async {
    http.Response response;
    response = await http.get(
        Uri.parse('${dotenv.env['API_URL']}/catalogue/wishlist/'),
        headers: {
          "Content-Type": "application/json",
          "Authorization":
              'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjc0MDQwNjQ1LCJpYXQiOjE2NjU0MDA2NDUsImp0aSI6ImI0NDM0M2M3MDMyYTRhMWZiNzczNzAyZTJhMDkzYzMwIiwidXNlcl9pZCI6MX0.Hs1B5pTqMfP7h5DJT4JFI31Ze6gmeJgNCExVNCvEswo'
        });
    if (response.statusCode == 200) {
      // setState(() {
      _myFavourites = json.decode(response.body);

      notifyListeners();
      print(response.body);
      print('fetchMyFavourites called ');
      // });
      // print('runnnnn');
    } else {
      // print('not running');
    }
  }

  Future deleteMyFavourites(id) async {
    // print('delete');
    http.Response response;
    response = await http.delete(
        Uri.parse('${dotenv.env['API_URL']}/catalogue/wishlist/${id}/'),
        headers: {
          "Content-Type": "application/json",
          "Authorization":
              'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjc0MDQwNjQ1LCJpYXQiOjE2NjU0MDA2NDUsImp0aSI6ImI0NDM0M2M3MDMyYTRhMWZiNzczNzAyZTJhMDkzYzMwIiwidXNlcl9pZCI6MX0.Hs1B5pTqMfP7h5DJT4JFI31Ze6gmeJgNCExVNCvEswo'
        });
    if (response.statusCode == 200) {
      // setState(() {
      // _myFavourites = json.decode(response.body);
      fetchMyFavourites();

      print('delete called ');
      // });
      // print('runnnnn');
    } else {
      print('not running');
    }
  }
}
