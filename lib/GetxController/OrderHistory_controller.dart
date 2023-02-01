import 'dart:developer';
import '../Utils/API.dart';
import 'package:get/get.dart';
import 'package:flutter/widgets.dart';
import 'package:addcafe/Utils/Constant.dart';

class OrderHistoryController extends GetxController {
  RxList orderHistory = [].obs;
  Rx<TextEditingController> itemName = TextEditingController().obs;

  initfunction() {
    Future.delayed(const Duration(seconds: 1), () {
      fetchOrderHistory();
      log(kTOKENSAVED);
    });
  }

  fetchOrderHistory() async {
    orderHistory.value =
        await API.instance.get(endPoint: "order/user-order/", isHeader: true);
  }
}
