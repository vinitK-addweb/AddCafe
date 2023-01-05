import 'package:addcafe/Utils/Global.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import '../Models/Model_Faq.dart';
import 'dart:convert';
import '../Utils/API.dart';

class CouponController extends GetxController {
  // RxList<ModelFaq> faqData = <ModelFaq>[].obs;
  Rx<TextEditingController> coupon = TextEditingController().obs;
  RxString message = "".obs;
  var response = {}.obs;

  // initMethod() {
  //   Future.delayed(Duration(milliseconds: 1), () {
  //     fetchFaqData();
  //   });
  // }

// ---------------- Call faq Api to get data --------------------->
  // Future fetchFaqData() async {
  //   final response =
  //       await API.instance.get(endPoint: 'about/faq/', isHeader: false);

  //   // faqData.value =
  //   //     List<ModelFaq>.from(response.map((x) => ModelFaq.fromJson(x)));
  // }

  Future applyCoupon() async {
    print("object");
    final params = {"code": coupon.value.text};
    response.value = (await API.instance.post(
        endPoint: "promotion/apply-coupon/", params: params, isHeader: true))!;
    message = response!['message'];
    '$message'.showSuccess();
    // if (response!.isNotEmpty) {
    //   message = response['message'];
    // "${message}".showSuccess();
    // } else {
    //   "not".showSuccess();
    // }
    print("coupon data=================>>>>>>>>>>>>>>>>>>>>>>> " +
        response.toString());
  }
}
