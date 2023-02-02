import '../Utils/API.dart';
import 'package:get/get.dart';
import 'package:flutter/widgets.dart';

class SearchResultController extends GetxController {
  RxList searchResult = [].obs;
  Rx<TextEditingController> itemName = TextEditingController().obs;

  initfunction() {
    Future.delayed(const Duration(milliseconds: 1), () {
      fetchSearchResult();
    });
  }

  fetchSearchResult() async {
    final response = await API.instance.getwithouLoader(
        endPoint: "catalogue/active-product/?search=${itemName.value.text}",
        isHeader: true);

    searchResult.value = response;
  }
}
