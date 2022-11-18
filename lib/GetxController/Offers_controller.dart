import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Models/Model_Offers.dart';
import 'dart:convert';
import '../Utils/API.dart';

class OffersController extends GetxController {
  RxList<OffersModel> offers = <OffersModel>[].obs;
  RxInt idx = 0.obs;

  initCustom() {
    debugPrint(idx.value.toString());
    Future.delayed(Duration(milliseconds: 3), (() {
      fetchOffers();
    }));
  }

  fetchOffers() async {
    final response = await API.instance
        .get(endPoint: 'promotion/active-coupon/', isHeader: true);
    offers.value =
        List<OffersModel>.from(response.map((x) => OffersModel.fromJson(x)));

    debugPrint('offers data================> ${offers.value[0].name}');
  }

  bannerIdx(id) {
    debugPrint(id.toString());
    this.idx.value = id;
  }
}
