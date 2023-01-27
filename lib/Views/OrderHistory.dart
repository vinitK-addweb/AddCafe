import 'package:addcafe/Styles/ColorStyle.dart';
import 'package:addcafe/Styles/TextStyles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Components/AppBarStyle.dart';
import '../GetxController/MyHomePage_controller.dart';
import '../GetxController/OrderHistory_controller.dart';

class OrderHistory extends StatelessWidget {
  OrderHistory({super.key});
  final controller = Get.put(OrderHistoryController());
  final homPageController = Get.put(HomeBannerController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarStyle(
          title: 'Order History',
          styleTitle: TextStylesCustom.textStyles_20,
          backgroundColor: ColorStyle.primaryColorRed,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              homPageController.currentIndex.value = 0;
            },
          ),
        ),
        body: controller.orderHistory.isEmpty
            ? Center(
                child: Text(
                " Please order somthing....",
                style: TextStylesCustom.textStyles_20.apply(
                    fontWeightDelta: 3, color: ColorStyle.secondryColorRed),
              ))
            : SingleChildScrollView(
                child: Column(
                children: const [
                  Text("data"),
                ],
              ))

        //  ElevatedButton(
        //   onPressed: () {
        //     controller.fetchOrderHistory();
        //   },
        //   child: Text("click"),
        // ),
        );
  }
}
