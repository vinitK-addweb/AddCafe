import 'dart:developer';
import '../Utils/API.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:addcafe/Utils/Global.dart';

class OffersController extends GetxController {
  RxList offers = [].obs;
  RxString CouponName = ''.obs;

  Map checkout = {};
  Rx<TextEditingController> coupon = TextEditingController().obs;
  RxString message = "".obs;

  var couponData = {}.obs;

  initCustom() {
    Future.delayed(const Duration(milliseconds: 3), (() {
      fetchOffers();
    }));
  }

  fetchOffers() async {
    offers.value = await API.instance
        .get(endPoint: 'promotion/active-coupon/', isHeader: true);
  }

  Future applyCoupon(value) async {
    log("applycoupon works-------->>");
    final params = {"code": value};
    var data = (await API.instance.post(
        endPoint: "promotion/apply-coupon/", params: params, isHeader: true))!;

    couponData.value = data;
  }

  checkOut() async {
    log("check out works-------->>>");
    final param = {
      "coupon_id": couponData['payload'] == null
          ? ''
          : couponData['payload']['coupon_id'].toString()
    };

    checkout = await API.instance
        .post(endPoint: 'cart/checkout/', params: param, isHeader: true) as Map;


    update();
    log(checkout.toString());
  }

  // bannerIdx(id) {
  //   debugPrint(id.toString());
  //   idx.value = id;
  // }
}
