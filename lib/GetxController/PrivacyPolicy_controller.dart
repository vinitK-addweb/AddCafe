import 'dart:convert';

import 'package:flutter/material.dart';
import '../Models/Model_PrivacyPolicy.dart';
import 'package:get/get.dart';
import '../Models/Model_Terms&Conditions.dart';
import '../Utils/API.dart';

class PrivacyPolicyController extends GetxController {
  RxList<PrivacyPolicy> privacyPolicy = <PrivacyPolicy>[].obs;
  RxList<TermsCondtionsModel> termsCondtions = <TermsCondtionsModel>[].obs;
  initfunction() {
    Future.delayed(Duration(milliseconds: 1), () {
      fetchPrivacyPolicy();
      fetchTermsCondtions();
    });
  }

  fetchPrivacyPolicy() async {
    print("object==========>>>>>");
    final response = await API.instance
        .get(endPoint: "about/privacyandpolicy/", isHeader: false);
    // print("the response data ========>>>>>>" + response.toString());
    privacyPolicy.value = List<PrivacyPolicy>.from(
        response.map((x) => PrivacyPolicy.fromJson(x)));
    print("the response data ========>>>>>>" +
        privacyPolicy.value[0].id.toString());
    //  print(pricayPolicy.value)
  }

  fetchTermsCondtions() async {
    print("object==========>>>>>");
    final response = await API.instance
        .get(endPoint: "about/termsandcondition/", isHeader: false);
    // print("the response data ========>>>>>>" + response.toString());
    termsCondtions.value = List<TermsCondtionsModel>.from(
        response.map((x) => TermsCondtionsModel.fromJson(x)));
    print("the response data ========>>>>>>" +
        termsCondtions.value[0].id.toString());
    //  print(pricayPolicy.value)
  }
}
