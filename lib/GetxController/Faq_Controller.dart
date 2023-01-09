import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import '../Models/Model_Faq.dart';
import 'dart:convert';
import '../Utils/API.dart';

class FaqController extends GetxController {
  RxList<ModelFaq> faqData = <ModelFaq>[].obs;
  final currentid = 0.obs;

  initMethod() {
    Future.delayed(Duration(milliseconds: 1), () {
      fetchFaqData();
    });
  }

// ---------------- Call faq Api to get data --------------------->
  Future fetchFaqData() async {
    final response =
        await API.instance.get(endPoint: 'about/faq/', isHeader: false);

    faqData.value =
        List<ModelFaq>.from(response.map((x) => ModelFaq.fromJson(x)));
  }
}
