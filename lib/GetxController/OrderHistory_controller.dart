import 'package:flutter/widgets.dart';

import 'package:get/get.dart';

import '../Utils/API.dart';

class OrderHistoryController extends GetxController {
  RxList orderHistory = [].obs;
  Rx<TextEditingController> itemName = TextEditingController().obs;
  // RxList<TermsCondtionsModel> termsCondtions = <TermsCondtionsModel>[].obs;
  initfunction() {
    Future.delayed(const Duration(seconds: 1), () {
      fetchOrderHistory();
    });
  }

  fetchOrderHistory() async {
    // print("search" + itemName.toString());
    orderHistory.value =
        await API.instance.get(endPoint: "order/user-order/", isHeader: true);

    // Future.delayed(const Duration(seconds: 2), () {
    //   searchResult.value = response;
    // });
    // update();
  }
}
