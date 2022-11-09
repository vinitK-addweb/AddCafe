import 'package:addcafe/Views/Auth/Signin.dart';
import 'package:addcafe/Views/Wishlist.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';
import 'package:addcafe/Utils/API.dart';
import 'package:addcafe/Utils/Constant.dart';
import 'package:addcafe/Models/Model_MyWishList.dart';
import '../Utils/Constant.dart';
import '../Utils/Global.dart';

class MyFavouritesApi extends GetxController {
  RxList<Wishlist> myFavourites = <Wishlist>[].obs;

  // List get myFavouritesData {
  //   return myFavourites;
  // }

  initMethod() {
    Future.delayed(Duration(milliseconds: 1), () {
      fetchMyFavourites();
    });
  }

  Future fetchMyFavourites() async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();

    if (kTOKENSAVED != '') {
      final wishlist = await API.instance
          .get(endPoint: APIEndPoints.instance.KWishlist, isHeader: true);

      myFavourites.value =
          List<Wishlist>.from(wishlist.map((x) => Wishlist.fromJson(x)));

      Get.to(() => Wishlist());
    } else {
      Get.to(() => Mylogin());
    }
  }

  Future deleteMyFavourites(id) async {
    if (kTOKENSAVED != null) {
      await API.instance.delete(
          endPoint: '${APIEndPoints.instance.KWishlist}${id}/', isHeader: true);
      fetchMyFavourites();
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

  // List isInMyFavorites(productId) {
  //   var a = myFavouritesData
  //       .where((element) => element['product'] == productId)
  //       .toList();
  //   return a;
  // }

}
