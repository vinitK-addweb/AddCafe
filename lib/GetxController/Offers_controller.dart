import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Models/Model_Offers.dart';
import 'dart:convert';
import '../Utils/API.dart';

class OffersController extends GetxController {
  RxList<OffersModel> offers = <OffersModel>[].obs;

  fetchOffers() async {
    final response = await API.instance
        .get(endPoint: 'promotion/active-coupon/', isHeader: true);
    offers.value =
        List<OffersModel>.from(response.map((x) => OffersModel.fromJson(x)));

    debugPrint('offers data================> ${offers.value[0].name}');
  }
}
