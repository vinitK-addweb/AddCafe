import '../Utils/API.dart';
import 'package:get/get.dart';
import '../Utils/Global.dart';
import '../Models/Model_Banner.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../Models/Model_MyHomePage.dart';
import '../Models/Model_Categories.dart';

class HomeBannerController extends GetxController {
  RxList<ModelBanner> bannerData = <ModelBanner>[].obs;

  RxList<ModelCategories> categoriesData = <ModelCategories>[].obs;

  RxList<ModelCustomerReviews> customerReviewsData =
      <ModelCustomerReviews>[].obs;
  RxInt currentIndex = 0.obs;
  RxBool search = false.obs;
  initMethodGetX() {
    Future.delayed(Duration(milliseconds: 1), () {
      fetchHomeBanner();
      fetchHomeCategory();
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

  setCurrentIndex(index) {
    debugPrint("index value is=========>>>>>>>>>>>>>>>>>>>>>>>>>>>"+index.toString());
    currentIndex.value = index;
  }
}
