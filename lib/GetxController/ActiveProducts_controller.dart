import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:get/get.dart';
import '../Utils/API.dart';
import '../Utils/Global.dart';
import '../Models/Model_ActiveProducts.dart';

class ActiveProductsController extends GetxController {
  // List<ModelActiveProducts> allProducts = <ModelActiveProducts>[];
  // RxList<ModelActiveProducts> allProducts = <ModelActiveProducts>[].obs;
  // RxList<ModelActiveProducts> categoryProduct = <ModelActiveProducts>[].obs;
  RxList allProducts = [].obs;
  RxList categoryProduct = [].obs;
  RxString selectedCategory = ''.obs;
  RxString checkingObx = " ".obs;
  RxList currentProducts = [].obs;

  initCustom() {
    Future.delayed(Duration(milliseconds: 50), () {
      fetchAllProducts();
      // categoryProductFilter();
    });
  }

  Future fetchAllProducts() async {
    http.Response response;
    response = await http.get(Uri.parse(
        'https://cafe.addwebprojects.com/api/v1/catalogue/active-product/'));

    if (response.statusCode == 200) {
      // List<ModelActiveProducts> allProducts = List<ModelActiveProducts>.from(
      //     jsonDecode(response.body)
      //         .map((x) => ModelActiveProducts.fromJson(x)));

      log(response.body);
      allProducts.value = jsonDecode(response.body) as List;

      print("dadadsadada" + allProducts[0]['category_name'].toString());
      // Future.delayed(Duration(milliseconds: 2), () {
      //   categoryProductFilter();
      // });
      update();
    }
  }

  getFilteredProducts(categoryName) {
    print('category name' + categoryName);
    // print(" heloooo==========dsadasda");
    categoryProduct.value = allProducts
        .where((item) => item["category_name"] == categoryName)
        .toList();

    // currentProducts.value = allProducts
    //     .where((item) => item["category_name"] == categoryName)
    //     .toList();
    Future.delayed(Duration(milliseconds: 200), () {
      update();
      // categoryProductFilter();
    });
    //
    print(" dasdfa897565798765578675467 ${categoryProduct.value.length}");
  }

  // categoryProductFilter() {
  //   categoryProduct.value = allProducts
  //       .where((item) => item.categoryName == selectedCategory)
  //       .toList();
  //   print('fetch all product here=========>>>${categoryProduct.value}');
  //   update();
  // }

  // changeCategory(String category) {
  //   debugPrint(' category data=========${category}');
  //   if (selectedCategory == category) {
  //     selectedCategory = '';
  //   } else {
  //     selectedCategory = category;
  //   }
  //   update();
  // }
}
