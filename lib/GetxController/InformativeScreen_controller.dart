import 'dart:developer';

import '../Utils/API.dart';
import 'package:get/get.dart';
import '../Models/Model_Faq.dart';

class InformativeController extends GetxController {
  RxList informativeData = [].obs;

  RxInt currentIndex = 1.obs;

  initMethod() {
    Future.delayed(const Duration(milliseconds: 1), () {
      getInformativeScreen();
    });
  }

// ---------------- Call faq Api to get data --------------------->
getInformativeScreen()async {
  informativeData.value = await API.instance.get(
      endPoint: "about/informative-screen/", isHeader: false);

  log(informativeData.toString());
}
}
