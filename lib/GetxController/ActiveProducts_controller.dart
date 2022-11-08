import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:get/get.dart';
import '../Utils/API.dart';
import '../Utils/Global.dart';
import '../Models/Model_ActiveProducts.dart';

class CategoriesApi with ChangeNotifier {
  RxList<ModelActiveProducts> allProducts = <ModelActiveProducts>[].obs;
  List _allProducts = [];
  List _categoryProduct = [];

  // gettters

  // List get allProducts {
  //   return _allProducts;
  // }

  // List get categoryProduct {
  //   return _categoryProduct;
  // }

  //actions

  Future fetchAllProducts() async {
    http.Response response;
    response = await http.get(Uri.parse(
        'https://cafe.addwebprojects.com/api/v1/catalogue/active-product/'));

    if (response.statusCode == 200) {
      _allProducts = jsonDecode(response.body);
      print('fetchAllProducts called');
      notifyListeners();
    }
  }

  // getFilteredProducts(categoryName) {
  //   _categoryProduct = allProducts
  //       .where((item) => item["category_name"] == categoryName)
  //       .toList();
  // }
}
