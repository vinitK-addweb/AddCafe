import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../Models/Model_MyHomePage.dart';
import '../Models/Model_Banner.dart';
import '../Models/Model_Categories.dart';
import '../Utils/API.dart';
import '../Utils/Global.dart';

class HomeBannerController extends GetxController {
  RxList<ModelBanner> bannerData = <ModelBanner>[].obs;
  // RxList<ModelHomeBanner> homeBannerData = <ModelHomeBanner>[].obs;
  RxList<ModelCategories> categoriesData = <ModelCategories>[].obs;
  // RxList<ModelHomeCategory> homeCategoryData = <ModelHomeCategory>[].obs;
  RxList<ModelCustomerReviews> customerReviewsData =
      <ModelCustomerReviews>[].obs;
  RxInt currentIndex = 0.obs;
  RxBool search = false.obs;
  initMethodGetX() {
    Future.delayed(Duration(milliseconds: 1), () {
      fetchHomeBanner();
      fetchHomeCategory();
      // fetchCustomerReviews();
    });
  }

// ---------------------- Fetch Banner Data from Api----------------------->
  Future fetchHomeBanner() async {
    final response = await API.instance
        .get(endPoint: 'promotion/active-banner/', isHeader: false);
    if (response != null) {
      bannerData.value =
          List<ModelBanner>.from(response.map((x) => ModelBanner.fromJson(x)));
      debugPrint('fetchHomeBanner called');
    } else {
      response!['message'].toString().showError();
    }
  }

// ---------------------- Fetch Categories Data from Api----------------------->
  Future fetchHomeCategory() async {
    final response = await API.instance
        .get(endPoint: 'catalogue/active-category/', isHeader: false);
    if (response != null) {
      categoriesData.value = List<ModelCategories>.from(
          response.map((x) => ModelCategories.fromJson(x)));
      print('fetchHomeCategory called');
    } else {
      response['message'].toString().showError();
    }
  }

  // Future fetchCustomerReviews() async {
  //   final response = await API.instance.get(
  //       endPoint: 'https://vinit-api-data.herokuapp.com/customerReviews',
  //       isHeader: false);
  //   if (response != null) {
  //     customerReviewsData.value = List<ModelCustomerReviews>.from(
  //         response.map((x) => ModelCustomerReviews.fromJson(x)));
  //     print('fetchCUstomerReviews called');
  //   } else {
  //     response['message'].toString().showError();
  //   }
  // }

  setCurrentIndex(index) {
    currentIndex.value = index;
  }
}
