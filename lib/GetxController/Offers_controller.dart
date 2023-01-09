import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Models/Model_Offers.dart';
import 'dart:convert';
import '../Utils/API.dart';
import '../Utils/Constant.dart';
import '../Views/Auth/Signin.dart';

class OffersController extends GetxController {
  RxList<OffersModel> offers = <OffersModel>[].obs;
  RxInt idx = 0.obs;

  initCustom() {
    debugPrint(idx.value.toString());
    Future.delayed(const Duration(milliseconds: 3), (() {
      fetchOffers();
    }));
  }

  fetchOffers() async {
    if (kTOKENSAVED != '') {
      final response = await API.instance
          .get(endPoint: 'promotion/active-coupon/', isHeader: true);
      offers.value =
          List<OffersModel>.from(response.map((x) => OffersModel.fromJson(x)));
    } else {
      Get.to(() => Mylogin());
    }
  }

  bannerIdx(id) {
    debugPrint(id.toString());
    this.idx.value = id;
  }
}
