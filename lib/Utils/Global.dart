import 'package:addcafe/Styles/ColorStyle.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_share/flutter_share.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
// import '../Styles/ColorStyle.dart';
// import '../Styles/TextStyles.dart';

showLoaderGetX() {
  Get.dialog(
    Material(
      color: Colors.transparent,
      child: Center(
        child:
            // ListTile(
            //   leading:
            LoadingAnimationWidget.newtonCradle(
          color: ColorStyle.primaryColorRed,
          size: 125,
        ),
        // title: Text(
        //   'staggered dots wave',
        //   textScaleFactor: 1.5,
        // ),
        // ),
        // Container(
        //   height: 60,
        //   margin: const EdgeInsets.only(left: 40, right: 40),
        //   decoration: BoxDecoration(
        //       color: Colors.red, borderRadius: BorderRadius.circular(4)),
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: [
        //       const SizedBox(
        //         height: 30,
        //         width: 30,
        //         child: CircularProgressIndicator(
        //           strokeWidth: 3,
        //           valueColor: AlwaysStoppedAnimation<Color>(Colors.yellow),
        //         ),
        //       ),
        //       Container(
        //         width: 16,
        //       ),
        //       const Text("Loading ...", style: TextStyle(color: Colors.white)),
        //     ],
        //   ),
        // ),
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
