import 'package:flutter/material.dart';
import 'package:get/get.dart';

showLoaderGetX() {
  Get.dialog(
    Material(
      color: Colors.transparent,
      child: Center(
        child: Container(
          height: 60,
          margin: EdgeInsets.only(left: 40, right: 40),
          decoration: BoxDecoration(
              color: Colors.blue, borderRadius: BorderRadius.circular(4)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 30,
                width: 30,
                child: CircularProgressIndicator(
                  strokeWidth: 3,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                ),
              ),
              Container(
                width: 16,
              ),
              Text("Loading ...",
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
    ),
    barrierDismissible: false,
  );
}

hideLoader() {
  Navigator.pop(Get.context!);
}

extension SnackBar on String {
  showSuccess() {
    Get.snackbar('Success', this,
        backgroundColor: Colors.green, colorText: Colors.white);
  }

  showError() {
    Get.snackbar('Error!', this,
        backgroundColor: Colors.red, colorText: Colors.white);
  }
}

goToAnotherScreen(Widget page) {
  GetPage(
      name: '/second',
      page: () => page,
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 500),
      curve: Curves.fastOutSlowIn);
}
