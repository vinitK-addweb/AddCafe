import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';
import 'package:addcafe/Utils/API.dart';
import 'package:addcafe/Utils/Constant.dart';

class MyFavouritesApi extends GetxController {
  List<dynamic> myFavourites = [];

  List get myFavouritesData {
    return myFavourites;
  }

  Future fetchMyFavourites() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (kTOKENSAVED != null) {
      myFavourites = API.instance.get(endPoint: APIEndPoints.instance.KWishlist)
          as List<dynamic>;

      // http.Response response;
      // response = await http.get(
      //     Uri.parse('${dotenv.env['API_URL']}/catalogue/wishlist/'),
      //     headers: {
      //       "Content-Type": "application/json",
      //       "Authorization": 'Bearer ${prefs.get('token')}'
      //     });

      // if (response.statusCode == 200) {
      //   if (myFavourites != json.decode(response.body)) {
      //     myFavourites = await json.decode(response.body);
      //     print('hi mukesh');
      //   }
      debugPrint('${myFavourites}');
      print('fetchMyFavourites called ');
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
      print(myFavourites);
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
