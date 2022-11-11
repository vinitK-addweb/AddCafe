import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:get/get.dart';
import '../Utils/API.dart';
import '../Utils/Global.dart';
import '../Models/Model_ActiveProducts.dart';

class ActiveProductsController with ChangeNotifier {
  RxList<ModelActiveProducts> allProducts = <ModelActiveProducts>[].obs;
  // List _allProducts = [];
  // RxList<ModelActiveProducts> categoryProduct = <ModelActiveProducts>[].obs;
  List<ModelActiveProducts> categoryProduct = [];
  RxString currentCategory = ''.obs;

  // gettters

  // List get allProducts {
  //   return _allProducts;
  // }

  // List get categoryProduct {
  //   return _categoryProduct;
  // }

  //actions

  Future fetchAllProducts() async {
    // final response = await API.instance
    //     .get(endPoint: 'catalogue/active-product/', isHeader: false);
    // print('fetch all product here=========>>>${response}');
    // if (response != null) {
    //   allProducts.value = List<ModelActiveProducts>.from(
    //       response.map((x) => ModelActiveProducts.fromJson(x)));
    // }
    // print('fetch all product is running=========>>>');
    http.Response response;
    response = await http.get(Uri.parse(
        'https://cafe.addwebprojects.com/api/v1/catalogue/active-product/'));

    if (response.statusCode == 200) {
      allProducts.value = List<ModelActiveProducts>.from(
          jsonDecode(response.body)
              .map((x) => ModelActiveProducts.fromJson(x)));

      // ModelActiveProducts.fromJson(json.decode(response.body))
      //     as Set<ModelActiveProducts>;
      // print('fetchAllProducts called');
      print(
          'fetch all product here=========>>>${allProducts.value[1].categoryName}');
    }
  }

  getFilteredProducts(String category) async {
    // await fetchAllProducts();
    // print('category================>>>>>>>>>>>>>>>${category}');
    // print(
    //     'filter-----------------${allProducts.where((item) => item.categoryName == category).toList()}');
    // allProducts.where((item) => item.categoryName == category);

    // categoryProduct.value =
    categoryProduct = await allProducts
        .where((item) => item.categoryName == category)
        .toList();
    print(
        'category data is ??????????????????????????????? ${categoryProduct[0].categoryName}');
  }

  changeCategory(String category) {
    if (currentCategory == category) {
      currentCategory.value = '';
      ;
    } else {
      currentCategory.value = category;
    }
  }
}
