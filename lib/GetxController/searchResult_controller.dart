import 'package:flutter/widgets.dart';

import '../Models/Model_PrivacyPolicy.dart';
import 'package:get/get.dart';

import '../Utils/API.dart';

class SearchResultController extends GetxController {
  RxList searchResult = [].obs;
  Rx<TextEditingController> itemName = TextEditingController().obs;
  // RxList<TermsCondtionsModel> termsCondtions = <TermsCondtionsModel>[].obs;
  initfunction() {
    Future.delayed(const Duration(milliseconds: 1), () {
      fetchSearchResult();
    });
  }

  fetchSearchResult() async {
    // print("search" + itemName.toString());
    final response = await API.instance.getwithouLoader(
        endPoint: "catalogue/active-product/?search=${itemName.value.text}",
        isHeader: true);
    // print("search result" + response.toString());
    searchResult.value = response;
    // print("the response data ========>>>>>>" +
    //     searchResult.value[0].id.toString());
  }
}
