import 'dart:developer';

import 'package:addcafe/Utils/Global.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Models/Model_Offers.dart';
import 'dart:convert';
import '../Utils/API.dart';
import '../Utils/Constant.dart';
import '../Views/Auth/Signin.dart';

class OffersController extends GetxController {
  // RxList<OffersModel> offers = <OffersModel>[].obs;
  RxList offers = [].obs;
  RxInt idx = 0.obs;
  Rx<TextEditingController> coupon = TextEditingController().obs;
  RxString message = "".obs;
  var response = {}.obs;
  initCustom() {
    debugPrint(idx.value.toString());
    Future.delayed(const Duration(milliseconds: 3), (() {
      fetchOffers();
    }));
  }

  fetchOffers() async {
    log(kTOKENSAVED);
    log('hello=========================>>>>>>>>>>>>>>>>>>>');
    offers.value = await API.instance
        .get(endPoint: 'promotion/active-coupon/', isHeader: true);
    // offers.value =
    //     List<OffersModel>.from(response.map((x) => OffersModel.fromJson(x)));
    // log('byeeeeeeeeeeeeee========================>>>>>>>>>>>>>>>>>>>' +
    //     offers.toString());
    // log(response);
  }

  Future applyCoupon(value) async {
    print("object");
    final params = {"code": value};
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
    log("coupon data=================>>>>>>>>>>>>>>>>>>>>>>> " +
        response.toString());
  }

  bannerIdx(id) {
    debugPrint(id.toString());
    this.idx.value = id;
  }
}
