import 'package:addcafe/Views/Auth/Signin.dart';
import 'package:addcafe/Views/Wishlist.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:get/get.dart';
import '../Utils/API.dart';

import '../Models/Model_MyWishList.dart';
import '../Utils/Constant.dart';

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

      // Get.to(() => Wishlist());
    } else {
      Get.to(() => Mylogin());
    }
  }

  Future deleteMyFavourites(id) async {
    if (kTOKENSAVED != null) {
      await API.instance.delete(
          endPoint: '${APIEndPoints.instance.KWishlist}$id/', isHeader: true);
      fetchMyFavourites();
      isInMyFavorites(id);
    }
  }

  Future addToMyFavorites(productData) async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    http.Response response;

    // print(productData);
    // print(kTOKENSAVED);
    response = await http.post(
        Uri.parse('https://cafe.addwebprojects.com/api/v1/catalogue/wishlist/'),
        headers: {
          "Content-Type": "application/json",
          "Authorization": 'Bearer $kTOKENSAVED'
        },
        body: jsonEncode(productData));

    if (response.statusCode == 200) {
      fetchMyFavourites();
      isInMyFavorites(productData['id']);
      // update();
    } else {
      print('addToMyFavorites not called');
    }
  }

  List isInMyFavorites(productId) {
    var a =
        myFavourites.where((element) => element.product == productId).toList();
    // update();
    return a;
  }
}
