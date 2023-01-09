import 'package:addcafe/Styles/ColorStyle.dart';
import 'package:addcafe/Styles/TextStyles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Components/AppBarStyle.dart';
import '../GetxController/OrderHistory_controller.dart';

class OrderHistory extends StatelessWidget {
  OrderHistory({super.key});
  final controller = Get.put(OrderHistoryController());
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
              Get.back();
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            controller.orderHistory.isEmpty
                ? const Center(child: Text(" Please order somthing"))
                : Text("data")
          ]),
        )

        //  ElevatedButton(
        //   onPressed: () {
        //     controller.fetchOrderHistory();
        //   },
        //   child: Text("click"),
        // ),
        );
  }
}
