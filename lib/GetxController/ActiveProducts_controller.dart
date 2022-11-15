import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:get/get.dart';
import '../Utils/API.dart';
import '../Utils/Global.dart';
import '../Models/Model_ActiveProducts.dart';

class ActiveProductsController extends GetxController {
  // List<ModelActiveProducts> allProducts = <ModelActiveProducts>[];

  RxList<ModelActiveProducts> categoryProduct = <ModelActiveProducts>[].obs;

  String selectedCategory = '';
  RxString checkingObx = "Checking OBX ...".obs;

  Future fetchAllProducts() async {
    http.Response response;
    response = await http.get(Uri.parse(
        'https://cafe.addwebprojects.com/api/v1/catalogue/active-product/'));

    if (response.statusCode == 200) {
      List<ModelActiveProducts> allProducts = List<ModelActiveProducts>.from(
          jsonDecode(response.body)
              .map((x) => ModelActiveProducts.fromJson(x)));

      categoryProduct.value = allProducts
          .where((item) => item.categoryName == selectedCategory)
          .toList();
      print('fetch all product here=========>>>${categoryProduct.value}');
      update();
    }
  }

  changeCategory(String category) {
    debugPrint(category);
    if (selectedCategory == category) {
      selectedCategory = '';
      ;
    } else {
      selectedCategory = category;
    }
  }
}
