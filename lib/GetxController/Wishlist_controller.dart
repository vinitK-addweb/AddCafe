import 'package:addcafe/Views/Auth/Signin.dart';
import 'package:addcafe/Views/Wishlist.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';
import '../Utils/API.dart';

import '../Models/Model_MyWishList.dart';
import '../Utils/Constant.dart';
import '../Utils/Global.dart';
import '../Styles/TextStyles.dart';
import '../Styles/ColorStyle.dart';

class MyFavouritesApi extends GetxController {
  RxList<Wishlist> myFavourites = <Wishlist>[].obs;

  // List get myFavouritesData {
  //   return myFavourites;
  // }

  initMethod() {
    Future.delayed(Duration(milliseconds: 10), () {
      fetchMyFavourites();
    });
  }

  Future fetchMyFavourites() async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();

    // if (kTOKENSAVED != '') {
    final wishlist = await API.instance
        .get(endPoint: APIEndPoints.instance.KWishlist, isHeader: true);

    myFavourites.value =
        List<Wishlist>.from(wishlist.map((x) => Wishlist.fromJson(x)));

    //   Get.to(() => Wishlist());
    // } else {
    //   Get.to(() => Mylogin());
    // }
  }

  Future deleteMyFavourites(id) async {
    if (kTOKENSAVED != null) {
      await API.instance
          .delete(endPoint: 'catalogue/wishlist/$id/', isHeader: true);
      fetchMyFavourites();
      isInMyFavorites(id);
      // update();
      print("runninf");
    }
  }

  Future addToMyFavorites(productData) async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    http.Response response;

    print(productData);
    print(kTOKENSAVED);
    response = await http.post(
        Uri.parse('https://cafe.addwebprojects.com/api/v1/catalogue/wishlist/'),
        headers: {
          "Content-Type": "application/json",
          "Authorization": 'Bearer $kTOKENSAVED'
        },
        body: jsonEncode(productData));
    print("dasdasdas" + response.body.toString());
    if (response.statusCode == 200) {
      print('addToMyFavorites called');
      fetchMyFavourites();
      // isInMyFavorites(productData['id']);
      // update();
    } else {
      print('addToMyFavorites not called');
    }
  }

  List isInMyFavorites(productId) {
    print("the is data is here ==============>>>>>>>>>>>>>>>> $productId");
    var a =
        myFavourites.where((element) => element.product == productId).toList();

    return a;
  }
}
