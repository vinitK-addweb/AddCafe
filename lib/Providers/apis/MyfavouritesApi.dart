import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:localstorage/localstorage.dart';

class MyFavouritesApi with ChangeNotifier {
  List _myFavourites = [];

  List get myFavouritesData {
    return _myFavourites;
  }

  Future fetchMyFavourites() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (prefs.get('token') != null) {
      http.Response response;
      response = await http.get(
          Uri.parse('${dotenv.env['API_URL']}/catalogue/wishlist/'),
          headers: {
            "Content-Type": "application/json",
            "Authorization": 'Bearer ${prefs.get('token')}'
          });

      if (response.statusCode == 200) {
        if (_myFavourites != json.decode(response.body)) {
          _myFavourites = await json.decode(response.body);
          print('hi mukesh');
          notifyListeners();
        }

        print('fetchMyFavourites called ');
      }
    }
    // else {
    //   Navigator.pushNamed(context, '/signin');
    //   ;
    // }
  }

  Future deleteMyFavourites(id, context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    http.Response response;
    response = await http.delete(
        Uri.parse('${dotenv.env['API_URL']}/catalogue/wishlist/${id}/'),
        headers: {
          "Content-Type": "application/json",
          "Authorization": 'Bearer ${prefs.get('token')}'
        });
    if (response.statusCode == 200) {
      fetchMyFavourites();
      print(_myFavourites);
      print('deleteMyFavourites called');
      // });
      // print('runnnnn');
    } else {
      print('not running');
    }
  }

  Future addToMyFavorites(productData, context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    http.Response response;
    response = await http.post(
        Uri.parse('https://cafe.addwebprojects.com/api/v1/catalogue/wishlist/'),
        headers: {
          "Content-Type": "application/json",
          "Authorization": 'Bearer ${prefs.get('token')}'
        },
        body: jsonEncode(productData));
    if (response.statusCode == 200) {
      print('addToMyFavorites called');
      fetchMyFavourites();
    } else {
      print('addToMyFavorites not called');
    }
  }

  List isInMyFavorites(productId) {
    var a = myFavouritesData
        .where((element) => element['product'] == productId)
        .toList();
    return a;
  }
}
