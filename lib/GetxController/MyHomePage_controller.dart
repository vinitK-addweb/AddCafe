import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../Models/Model_MyHomePage.dart';

class HomeBannerController extends GetxController {
  RxList<ModelHomeBanner> homeBannerData = <ModelHomeBanner>[].obs;
  RxList<ModelHomeCategory> homeCategoryData = <ModelHomeCategory>[].obs;
  RxList<ModelCustomerReviews> customerReviewsData =
      <ModelCustomerReviews>[].obs;
  RxInt currentIndex = 0.obs;

  initMethodGetX() {
    print("initMethodGetXinitMethodGetXinitMethodGetX");

    fetchHomeBanner();
    fetchHomeCategory();
    fetchCustomerReviews();
  }

  Future fetchHomeBanner() async {
    http.Response response;
    response = await http
        .get(Uri.parse('https://kindly-opposite-wishbone.glitch.me/products'));
    if (response.statusCode == 200) {
      // setState(() {
      homeBannerData.value = List<ModelHomeBanner>.from(
          json.decode(response.body).map((x) => ModelHomeBanner.fromJson(x)));
      // });
      print('fetchHomeBanner called');
    } else {}
  }

  Future fetchHomeCategory() async {
    http.Response response;
    response = await http.get(Uri.parse(
        'https://cafe.addwebprojects.com/api/v1/catalogue/active-category/'));
    if (response.statusCode == 200) {
      homeCategoryData.value = List<ModelHomeCategory>.from(
          json.decode(response.body).map((x) => ModelHomeCategory.fromJson(x)));
      print('fetchHomeCategory called');
    } else {}
  }

  Future fetchCustomerReviews() async {
    http.Response response;
    response = await http
        .get(Uri.parse('https://vinit-api-data.herokuapp.com/customerReviews'));
    if (response.statusCode == 200) {
      customerReviewsData.value = List<ModelCustomerReviews>.from(json
          .decode(response.body)
          .map((x) => ModelCustomerReviews.fromJson(x)));
      print('fetchCUstomerReviews called');
    }
  }

  setCurrentIndex(index) {
    currentIndex.value = index;
  }
}
