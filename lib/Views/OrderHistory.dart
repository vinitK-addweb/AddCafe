import 'package:addcafe/Components/ElevatedButtonCustom.dart';
import 'package:addcafe/Styles/ColorStyle.dart';
import 'package:addcafe/Styles/TextStyles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../Components/AppBarStyle.dart';
import '../GetxController/MyHomePage_controller.dart';
import '../GetxController/OrderHistory_controller.dart';

class OrderHistory extends StatelessWidget {
  OrderHistory({super.key});
  final controller = Get.put(OrderHistoryController());
  final homPageController = Get.put(HomeBannerController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: controller,
        initState: controller.initfunction(),
        builder: (_) {
          return Obx(() {
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
                            fontWeightDelta: 3,
                            color: ColorStyle.secondryColorRed),
                      ))
                    : SizedBox(
                        child: ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            // scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: controller.orderHistory.length,
                            itemBuilder: ((context, idx) {
                              return Container(
                                  padding: const EdgeInsets.all(10),
                                  margin: const EdgeInsets.all(10),
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(width: 0.1),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ListView.builder(
                                          shrinkWrap: true,
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          itemCount: controller
                                              .orderHistory[idx]['product']
                                              .length,
                                          itemBuilder: ((context, index) {
                                            return RichText(
                                              textAlign: TextAlign.start,
                                              text: TextSpan(
                                                  text:
                                                      '${controller.orderHistory[idx]['product'][index]['quantity']} x ',
                                                  style: TextStylesCustom
                                                      .textStyles_14
                                                      .apply(
                                                          color: ColorStyle
                                                              .secondryColorBlack
                                                              .withOpacity(
                                                                  0.5)),
                                                  children: <TextSpan>[
                                                    TextSpan(
                                                      text: controller.orderHistory[
                                                                          idx][
                                                                      'product']
                                                                  [index]
                                                              ['product_detail']
                                                          ['item_name'],
                                                      style: TextStylesCustom
                                                          .textStyles_14
                                                          .apply(
                                                              color: ColorStyle
                                                                  .secondryColorBlack),
                                                    )
                                                  ]),
                                            );
                                          })),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        padding: const EdgeInsets.only(
                                            bottom: 2, top: 2),
                                        decoration: BoxDecoration(
                                            border: Border(
                                                bottom: BorderSide(
                                                    width: 0.2,
                                                    color: ColorStyle
                                                        .secondryColorBlack))),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            '${DateFormat('dd MMM yyyy').format(DateTime.parse('${controller.orderHistory[idx]['order_creation_datetime']}'))} at ${DateFormat.jm().format(DateTime.parse('${controller.orderHistory[idx]['order_creation_datetime']}'))}',
                                            style:
                                                TextStylesCustom.textStyles_12,
                                          ),
                                          RichText(
                                            textAlign: TextAlign.start,
                                            text: TextSpan(
                                                text:
                                                    '₹${controller.orderHistory[idx]['order_total_cost']} ',
                                                style: TextStylesCustom
                                                    .textStyles_16
                                                    .apply(
                                                        color: ColorStyle
                                                            .secondryColorBlack),
                                                children: <TextSpan>[
                                                  TextSpan(
                                                    text: ' >',
                                                    style: TextStylesCustom
                                                        .textStyles_19
                                                        .apply(
                                                            color: ColorStyle
                                                                .secondryColorBlack
                                                                .withOpacity(
                                                                    0.5)),
                                                  )
                                                ]),
                                          )
                                        ],
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        padding: const EdgeInsets.only(
                                            bottom: 2, top: 2),
                                        decoration: BoxDecoration(
                                            border: Border(
                                                bottom: BorderSide(
                                                    width: 0.2,
                                                    color: ColorStyle
                                                        .secondryColorBlack))),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            controller.orderHistory[idx]
                                                        ['order_status'] ==
                                                    'order_placed'
                                                ? 'Pending'
                                                : 'Completed',
                                            style:
                                                TextStylesCustom.textStyles_14,
                                          ),
                                          FittedBox(
                                            child: ElevatedButtonCustom(
                                              text: 'ReOrder',
                                              size: const Size(100, 15),
                                              onTap: () {},
                                              radiusBorder: 8,
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ));
                            })),
                      ));
          });
        });
  }
}
