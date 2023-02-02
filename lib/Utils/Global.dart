import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:addcafe/Styles/ColorStyle.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

showLoaderGetX() {
  Get.dialog(
    Material(
      color: Colors.transparent,
      child: Center(
        child: LoadingAnimationWidget.newtonCradle(
          color: ColorStyle.primaryColorRed,
          size: 125,
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
  showError() {
    Get.snackbar(
      "Error!",
      this,
      backgroundColor: Colors.red,
      colorText: Colors.white,
    );
  }

  showSuccess() {
    Get.snackbar(
      "Success!",
      this,
      backgroundColor: Colors.green,
      colorText: Colors.white,
    );
  }
}

goToAnotherScreen(Widget page) {
  GetPage(
    name: "/second",
    page: () => page,
    transition: Transition.rightToLeft,
    transitionDuration: Duration(milliseconds: 400),
    curve: Curves.fastOutSlowIn,
  );
}

// bottom navigation same
navigateMultiBottom(context, Widget child) {
  Navigator.push(
      context, MaterialPageRoute(builder: (BuildContext context) => child));
}

spinkitLoader() {
  return const Center(child: SpinKitCircle(color: Colors.grey, size: 60.0));
}
