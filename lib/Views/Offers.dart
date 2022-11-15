import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Styles/ColorStyle.dart';
import '../Components/AppBarStyle.dart';
import '../GetxController/MyHomePage_controller.dart';

class Offers extends StatelessWidget {
  const Offers({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarStyle(
        title: 'Offers',
        backgroundColor: ColorStyle.primaryColorRed,
        leading: IconButton(
          onPressed: (() => Get.back()),
          icon: Icon(Icons.arrow_back),
          color: ColorStyle.secondryColorBlack,
        ),
      ),
    );
  }
}
