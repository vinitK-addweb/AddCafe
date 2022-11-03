import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../Models/Model_MyHomePage.dart';
import '../Utils/API.dart';
import '../Utils/Global.dart';

class HomeBannerController extends GetxController {
  RxList<ModelHomeBanner> homeBannerData = <ModelHomeBanner>[].obs;
  RxList<ModelHomeCategory> homeCategoryData = <ModelHomeCategory>[].obs;
  RxList<ModelCustomerReviews> customerReviewsData =
      <ModelCustomerReviews>[].obs;
  RxInt currentIndex = 0.obs;

  initMethodGetX() {
    print("initMethodGetXinitMethodGetXinitMethodGetX");

    Future.delayed(Duration(seconds: 5), () {
      fetchHomeBanner();
      fetchHomeCategory();
      fetchCustomerReviews();
    });
  }

  Future fetchHomeBanner() async {
    final response = await API.instance
        .get(endPoint: 'https://kindly-opposite-wishbone.glitch.me/products');
    if (response != null) {
      // if (response['statusCode'] == 200) {
      homeBannerData.value = List<ModelHomeBanner>.from(
          response.map((x) => ModelHomeBanner.fromJson(x)));
      debugPrint('fetchHomeBanner called');
      // }
    } else {
      response!['message'].toString().showError();
    }
  }

  Future fetchHomeCategory() async {
    final response = await API.instance.get(
        endPoint:
            'https://cafe.addwebprojects.com/api/v1/catalogue/active-category/');
    if (response != null) {
      // debugPrint(json.encode(response));
      homeCategoryData.value = List<ModelHomeCategory>.from(
          response.map((x) => ModelHomeCategory.fromJson(x)));
      print('fetchHomeCategory called');
    } else {
      response['message'].toString().showError();
    }
  }

  Future fetchCustomerReviews() async {
    final response = await API.instance
        .get(endPoint: 'https://vinit-api-data.herokuapp.com/customerReviews');
    if (response != null) {
      customerReviewsData.value = List<ModelCustomerReviews>.from(
          response.map((x) => ModelCustomerReviews.fromJson(x)));
      print('fetchCUstomerReviews called');
    } else {
      response['message'].toString().showError();
    }
  }

  setCurrentIndex(index) {
    currentIndex.value = index;
  }
}
