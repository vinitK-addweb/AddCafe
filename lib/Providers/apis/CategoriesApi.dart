import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class CategoriesApi with ChangeNotifier {
  List _allProducts = [];
  List _categoryProduct = [];

  // gettters

  List get allProducts {
    return _allProducts;
  }

  List get categoryProduct {
    return _categoryProduct;
  }

  //actions

  Future fetchAllProducts() async {
    http.Response response;
    response = await http.get(Uri.parse(
        'https://cafe.addwebprojects.com/api/v1/catalogue/active-product/'));

    if (response.statusCode == 200) {
      _allProducts = jsonDecode(response.body);
      // print(_allProducts);
      notifyListeners();
    }
  }

  getFilteredProducts(categoryName) {
    _categoryProduct = allProducts
        .where((item) => item["category_name"] == categoryName)
        .toList();
  }
}
