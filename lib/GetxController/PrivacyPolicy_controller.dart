import 'dart:convert';
import 'dart:developer';

import 'package:addcafe/Utils/Global.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../Utils/API.dart';
import 'package:get/get.dart';
import '../Models/Model_PrivacyPolicy.dart';
import '../Models/Model_Terms&Conditions.dart';
import '../Utils/Constant.dart';

class PrivacyPolicyController extends GetxController {
  RxList privacyPolicy = [].obs;
  RxInt currentIndex = 1.obs;
  RxInt starRating = 1.obs;
  Map userReview = {}.obs;
   final reviewData = TextEditingController();
  RxList<TermsCondtionsModel> termsCondtions = <TermsCondtionsModel>[].obs;
  initfunction() {
    // Future.delayed(const Duration(milliseconds: 1), () {
      fetchReviewList();
      fetchReview();
      // fetchTermsCondtions();
    // });
  }

  fetchReviewList() async {
    final response = await API.instance
        .get(endPoint: "order/review-list/", isHeader: false);

    privacyPolicy.value = response;
  }



  Future ReviewRating() async {
    final mapedData ={
        "rate": starRating.value.toString(),
        "review": reviewData.value.text
      };
    http.Response response;
    response = await http.post(Uri.parse('${kBaseUrl}order/review-list/'),
        headers: {
          "Content-Type": "application/json",
          "Authorization": 'Bearer $kTOKENSAVED'
        },
        body: jsonEncode(mapedData));
    final data = jsonDecode(response.body) ;
    log(response.body);
    if (response.statusCode == 200) {

      fetchReviewList();

    }else{
      log("dadsad ${ data['message']}");
      "${ data['message']}".showError();
    }
  }


  fetchReview() async {
    log("works fetch review");
    final response = await API.instance
        .get(endPoint: "order/review-list/get/", isHeader: true);

    userReview = response;
    if(userReview["payload"] !=null){
      starRating.value = userReview["payload"]["rate"];
      reviewData.text = userReview["payload"]["review"];
    }

    log("data====>> ${userReview}");
  }

  Future updateReviewRating() async{
    final mapedData ={
      "rate": starRating.value.toString(),
      "review": reviewData.value.text
    };
    http.Response response;
    response = await http.put(Uri.parse('${kBaseUrl}order/review-list/update/'),
        headers: {
          "Content-Type": "application/json",
          "Authorization": 'Bearer $kTOKENSAVED'
        },
        body: jsonEncode(mapedData));
    final data = jsonDecode(response.body) ;
    log(response.body);
    if (response.statusCode == 200) {

      fetchReviewList();
      "${ data['message']}".showSuccess();
    }else{
      log("dadsad ${ data['message']}");
      "${ data['message']}".showError();
    }
    // final mapedData ={
    //   "rate": starRating.value.toString(),
    //   "review": reviewData.value.text
    // };
    // var response = await API.instance.patch(endPoint: "order/review-list/update/", params: mapedData, isHeader: true);
    //    log(response.toString());
  }


}
