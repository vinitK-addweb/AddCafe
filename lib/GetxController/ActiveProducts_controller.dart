import 'dart:developer';
import '../Utils/API.dart';
import 'package:get/get.dart';

class ActiveProductsController extends GetxController {
  RxList allProducts = [].obs;
  RxList categoryProduct = [].obs;
  RxString selectedCategory = ''.obs;
  RxString checkingObx = " ".obs;
  RxList currentProducts = [].obs;
  bool isloader = true;
  initCustom() {
    Future.delayed(const Duration(milliseconds: 10), () {
      fetchAllProducts();
    });
  }

  Future fetchAllProducts() async {
    isloader = true;

    allProducts.value = await API.instance.get(
        endPoint: 'catalogue/active-product/',
        isHeader: false) as List<dynamic>;
    log(allProducts.length.toString());
    slectCategory(selectedCategory.value);

    isloader = false;
  }

  getFilteredProducts(categoryName) {
    categoryProduct.value = allProducts
        .where((item) => item["category_name"] == categoryName)
        .toList();

    update();
  }

  slectCategory(name) {
    selectedCategory.value = name;
    getFilteredProducts('$name');
  }
}
