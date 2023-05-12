import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Components/AppBarStyle.dart';
import '../Components/TextRichCustom.dart';
import '../Styles/ColorStyle.dart';
import '../Styles/TextStyles.dart';
import '../Utils/Constant.dart';
import '../Utils/Global.dart';

class OrderHistoryDetails extends StatelessWidget {
  OrderHistoryDetails({Key? key, required this.orderDetailData})
      : super(key: key);

  final orderDetailData;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarStyle(
          backgroundColor: ColorStyle.primaryColorRed,
          leading: IconButton(
            onPressed: () {
              // if(Get.isRegistered<HomeBannerController>() !=false){
              //   Get.find<HomeBannerController>().currentIndex.value =0;
              // }
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back,
              size: 25,
              color: Colors.white,
            ),
          ),
          styleTitle: TextStylesCustom.textStyles_20,
          title: 'Order History ',
        ),
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: orderDetailData != null
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Order Status : ${orderDetailData["order_status"]== "order_placed"?"Order Placed":"Order Completed"}",
                      style: TextStylesCustom.textStyles_19
                          .apply(fontWeightDelta: 3),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextRichCustom(
                      textFirst: "Order number ",
                      textSecond: orderDetailData["order_number"],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextRichCustom(
                      textFirst: "Order Time ",
                      textSecond: chnageDateINMMMdyyyyFormat(
                          orderDetailData["order_creation_datetime"]),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    // Text(orderDetailData["product"].length.toString()),
                    // SizedBox(
                    //     height:
                    //         orderDetailData["product"].length.toDouble() * 150,
                    //     child:
//                         ListView.builder(
//                           shrinkWrap: true,
//                             itemCount: orderDetailData["product"].length,
//                             itemBuilder: (context, index) {
//                               return
//
//                                 Card(
//                                 clipBehavior: Clip.antiAlias,
//                                 child: Container(
//                                   // height: 150,
//                                   padding: const EdgeInsets.only(bottom: 5),
//                                   child: Row(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         Expanded(
//                                             flex: 6,
//                                             child: ClipRRect(
//                                               borderRadius:
//                                                   BorderRadius.circular(10.0),
//                                               child: Image.network(
//                                                 "$kImgUrl${orderDetailData["product"][index]['product_detail']['featured_image']}",
//                                                 height: 110.0,
//                                                 width: 80.0,
//                                                 fit: BoxFit.fill,
//                                               ),
//                                               // Container(
//                                               //   height: 120,
//                                               //   width: 90,
//                                               //   decoration: BoxDecoration(
//                                               //       image: DecorationImage(
//                                               //           image: NetworkImage(
//                                               //               "$kImgUrl${orderDetailData["product"][index]['product_detail']['featured_image']}",),
//                                               //           fit: BoxFit.fill,)),
//                                               // ),
//                                             )),
//                                         SizedBox(
//                                           width: 7,
//                                         ),
//                                         Expanded(
//                                           flex: 14,
//                                           child: Container(
//                                             // padding: const EdgeInsets.only(top: 5),
//                                             child: Column(
//                                               crossAxisAlignment:
//                                                   CrossAxisAlignment.start,
//                                               mainAxisAlignment:
//                                                   MainAxisAlignment.end,
//                                               children: <Widget>[
//                                                 Text(
//                                                     "${orderDetailData["product"][index]['product_detail']['item_name']}",
//                                                     style: TextStylesCustom
//                                                         .textStyles_15),
//                                                 SizedBox(
//                                                   height: 3,
//                                                 ),
//                                                 Text(
//                                                   "${orderDetailData["product"][index]['product_detail']['description']}",
//                                                   maxLines: 12,
//                                                   style: TextStylesCustom
//                                                       .textStyles_9,
//                                                 ),
//                                                 Row(
//                                                   children: [
//                                                     Text(
//                                                       "Rating : ",
//                                                       style: TextStylesCustom
//                                                           .textStyles_14,
//                                                     ),
//                                                     RatingBar.builder(
//                                                       initialRating: orderDetailData[
//                                                                           "product"]
//                                                                       [index][
//                                                                   'product_detail']
//                                                               [
//                                                               'ratings']["total"]
//                                                           .toDouble(),
//                                                       minRating: 0,
//                                                       direction:
//                                                           Axis.horizontal,
//                                                       ignoreGestures: true,
//                                                       itemSize: 25,
//                                                       allowHalfRating: false,
//                                                       itemCount: 5,
//                                                       itemPadding:
//                                                           EdgeInsets.symmetric(
//                                                               horizontal: 4.0),
//                                                       itemBuilder:
//                                                           (context, _) => Icon(
//                                                         Icons.star,
//                                                         color: Colors.amber,
//                                                       ),
//                                                       onRatingUpdate: (rating) {
//                                                         // controller.starRating.value =rating.toInt();
//                                                         // print(rating);
//                                                       },
//                                                     ),
//                                                   ],
//                                                 ),
//                                                 Row(
//                                                   children: [
//                                                     TextRichCustom(
//                                                       textFirst: "Quantity ",
//                                                       textSecond: orderDetailData[
//                                                                       "product"]
//                                                                   [index]
//                                                               ['quantity']
//                                                           .toString(),
//                                                       color: ColorStyle
//                                                           .secondaryColorgrey,
//                                                     ),
//                                                     SizedBox(
//                                                       width: 20,
//                                                     ),
//                                                     TextRichCustom(
//                                                       textFirst: "Price ",
//                                                       textSecond:
//                                                           orderDetailData[
//                                                                       "product"]
//                                                                   [
//                                                                   index]['price']
//                                                               .toString(),
//                                                       color: ColorStyle
//                                                           .secondaryColorgrey,
//                                                     )
//                                                   ],
//                                                 ),
//                                                 SizedBox(
//                                                   height: 5,
//                                                 ),
// // Text(orderDetailData["product"][index]['add_on_data'].isNotEmpty ? orderDetailData["product"][index]['add_on_data'][0].toString()) : "",
//                                                 orderDetailData["product"]
//                                                                     [index]
//                                                                 ['add_on_data']
//                                                             .isEmpty ||
//                                                         orderDetailData["product"]
//                                                                         [index][
//                                                                     'add_on_data']
//                                                                 [0] ==
//                                                             null
//                                                     ? Text("")
//                                                     : Wrap(
//                                                         spacing: 8,
//                                                         runSpacing: 3,
//                                                         // mainAxisAlignment:
//                                                         //     MainAxisAlignment
//                                                         //         .spaceBetween,
//                                                         children: [
//                                                           TextRichCustom(
//                                                             textFirst:
//                                                                 "Addon : ",
//                                                             textSecond:
//                                                                 //   orderDetailData["product"][index]['add_on_data'].isNotEmpty?
//                                                                 orderDetailData["product"]
//                                                                             [
//                                                                             index]
//                                                                         [
//                                                                         'add_on_data'][0]
//                                                                     [
//                                                                     'addon_name'],
//                                                             color: ColorStyle
//                                                                 .secondaryColorgrey,
//                                                           ),
//                                                           TextRichCustom(
//                                                             textFirst:
//                                                                 "Price : ",
//                                                             textSecond: orderDetailData["product"]
//                                                                             [
//                                                                             index]
//                                                                         [
//                                                                         'add_on_data'][0]
//                                                                     [
//                                                                     'addon_price']
//                                                                 .toString(),
//                                                             color: ColorStyle
//                                                                 .secondaryColorgrey,
//                                                           ),
//                                                           TextRichCustom(
//                                                             textFirst:
//                                                                 "Quantity : ",
//                                                             textSecond: orderDetailData["product"]
//                                                                             [
//                                                                             index]
//                                                                         [
//                                                                         'add_on_data']
//                                                                     [
//                                                                     0]['quantity']
//                                                                 .toString(),
//                                                             color: ColorStyle
//                                                                 .secondaryColorgrey,
//                                                           ),
//                                                         ],
//                                                       ),
//                                                 Align(
//                                                   alignment:
//                                                       Alignment.bottomRight,
//                                                   child: Row(
//                                                     mainAxisAlignment:
//                                                         MainAxisAlignment.end,
//                                                     children: <Widget>[
//                                                       // FlatButton(
//                                                       // onPressed: null,
//                                                       // child: Text("DETAIL ITEM")),
//                                                       // FlatButton(
//                                                       // onPressed: null, child: Text("BELI")),
//                                                     ],
//                                                   ),
//                                                 )
//                                               ],
//                                             ),
//                                           ),
//                                         ),
//                                       ]),
//                                 ),
//                               );
//
//                               // Padding(
//                               //   padding: const EdgeInsets.all(14.0),
//                               //   child: Text(orderDetailData.toString()),
//                               // ),
//                             }),
                    ...List.generate(
                        orderDetailData["product"].length,
                        (index) => Card(
                              clipBehavior: Clip.antiAlias,
                              child: Container(
                                // height: 150,
                                padding: const EdgeInsets.only(bottom: 5),
                                child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                          flex: 6,
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            child: Image.network(
                                              "$kImgUrl${orderDetailData["product"][index]['product_detail']['featured_image']}",
                                              height: 110.0,
                                              width: 80.0,
                                              fit: BoxFit.fill,
                                            ),
                                            // Container(
                                            //   height: 120,
                                            //   width: 90,
                                            //   decoration: BoxDecoration(
                                            //       image: DecorationImage(
                                            //           image: NetworkImage(
                                            //               "$kImgUrl${orderDetailData["product"][index]['product_detail']['featured_image']}",),
                                            //           fit: BoxFit.fill,)),
                                            // ),
                                          )),
                                      SizedBox(
                                        width: 7,
                                      ),
                                      Expanded(
                                        flex: 14,
                                        child: Container(
                                          // padding: const EdgeInsets.only(top: 5),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: <Widget>[
                                              Text(
                                                  "${orderDetailData["product"][index]['product_detail']['item_name']}",
                                                  style: TextStylesCustom
                                                      .textStyles_15),
                                              SizedBox(
                                                height: 3,
                                              ),
                                              Text(
                                                "${orderDetailData["product"][index]['product_detail']['description']}",
                                                maxLines: 12,
                                                style: TextStylesCustom
                                                    .textStyles_9,
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    "Rating : ",
                                                    style: TextStylesCustom
                                                        .textStyles_14,
                                                  ),
                                                  RatingBar.builder(
                                                    initialRating: orderDetailData[
                                                                        "product"]
                                                                    [index][
                                                                'product_detail']
                                                            ['ratings']["total"]
                                                        .toDouble(),
                                                    minRating: 0,
                                                    direction: Axis.horizontal,
                                                    ignoreGestures: true,
                                                    itemSize: 25,
                                                    allowHalfRating: false,
                                                    itemCount: 5,
                                                    itemPadding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 4.0),
                                                    itemBuilder: (context, _) =>
                                                        Icon(
                                                      Icons.star,
                                                      color: Colors.amber,
                                                    ),
                                                    onRatingUpdate: (rating) {
                                                      // controller.starRating.value =rating.toInt();
                                                      // print(rating);
                                                    },
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  TextRichCustom(
                                                    textFirst: "Quantity ",
                                                    textSecond: orderDetailData[
                                                                "product"]
                                                            [index]['quantity']
                                                        .toString(),
                                                    color: ColorStyle
                                                        .secondaryColorgrey,
                                                  ),
                                                  SizedBox(
                                                    width: 20,
                                                  ),
                                                  TextRichCustom(
                                                    textFirst: "Price ",
                                                    textSecond: orderDetailData[
                                                                "product"]
                                                            [index]['price']
                                                        .toString(),
                                                    color: ColorStyle
                                                        .secondaryColorgrey,
                                                  )
                                                ],
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
// Text(orderDetailData["product"][index]['add_on_data'].isNotEmpty ? orderDetailData["product"][index]['add_on_data'][0].toString()) : "",
                                              orderDetailData["product"][index]
                                                              ['add_on_data']
                                                          .isEmpty ||
                                                      orderDetailData["product"]
                                                                      [index][
                                                                  'add_on_data']
                                                              [0] ==
                                                          null
                                                  ? Text("")
                                                  : Wrap(
                                                      spacing: 8,
                                                      runSpacing: 3,
                                                      // mainAxisAlignment:
                                                      //     MainAxisAlignment
                                                      //         .spaceBetween,
                                                      children: [
                                                        TextRichCustom(
                                                          textFirst: "Addon : ",
                                                          textSecond:
                                                              //   orderDetailData["product"][index]['add_on_data'].isNotEmpty?
                                                              orderDetailData["product"]
                                                                          [
                                                                          index]
                                                                      [
                                                                      'add_on_data'][0]
                                                                  [
                                                                  'addon_name'],
                                                          color: ColorStyle
                                                              .secondaryColorgrey,
                                                        ),
                                                        TextRichCustom(
                                                          textFirst: "Price : ",
                                                          textSecond: orderDetailData[
                                                                              "product"]
                                                                          [
                                                                          index]
                                                                      [
                                                                      'add_on_data'][0]
                                                                  [
                                                                  'addon_price']
                                                              .toString(),
                                                          color: ColorStyle
                                                              .secondaryColorgrey,
                                                        ),
                                                        TextRichCustom(
                                                          textFirst:
                                                              "Quantity : ",
                                                          textSecond: orderDetailData[
                                                                              "product"]
                                                                          [
                                                                          index]
                                                                      [
                                                                      'add_on_data']
                                                                  [
                                                                  0]['quantity']
                                                              .toString(),
                                                          color: ColorStyle
                                                              .secondaryColorgrey,
                                                        ),
                                                      ],
                                                    ),
                                              Align(
                                                alignment:
                                                    Alignment.bottomRight,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: <Widget>[
                                                    // FlatButton(
                                                    // onPressed: null,
                                                    // child: Text("DETAIL ITEM")),
                                                    // FlatButton(
                                                    // onPressed: null, child: Text("BELI")),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ]),
                              ),
                            )),
                    // ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if (orderDetailData['payment_mode'] != null)
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Payment Method",
                                style: TextStylesCustom.textStyles_14
                                    .apply(fontWeightDelta: 3),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(orderDetailData['payment_mode'],
                                  style: TextStylesCustom.textStyles_14)
                            ],
                          ),
                        orderDetailData["order_status"]== "order_placed"?
                        ElevatedButton(
                            onPressed: () {},
                            child:

                            Text("Cancel Order",
                                style: TextStylesCustom.textStyles_14)):  ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              primary: ColorStyle.primaryColorGreen, // Background color
                            ),
                            child:

                            Text("View Invoice",
                                style: TextStylesCustom.textStyles_14))
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Summary",
                      style: TextStylesCustom.textStyles_18,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Divider(
                      height: 1,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Subtotal",
                            style: TextStylesCustom.textStyles_14
                                .apply(fontWeightDelta: 3)),
                        Text(
                          "₹ " + orderDetailData['order_sub_cost'].toString(),
                          style: TextStylesCustom.textStyles_14,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Shipping",
                            style: TextStylesCustom.textStyles_14
                                .apply(fontWeightDelta: 3)),
                        Text(
                          "₹ " + orderDetailData['shipping_cost'].toString(),
                          style: TextStylesCustom.textStyles_14,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Tax",
                            style: TextStylesCustom.textStyles_14
                                .apply(fontWeightDelta: 3)),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "₹ " +
                                  orderDetailData['total_tax_cost'].toString(),
                              style: TextStylesCustom.textStyles_14,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            ...List.generate(
                                orderDetailData["tax_data"].length,
                                (idx) => TextRichCustoms(
                                      textFirst:
                                          "${orderDetailData["tax_data"][idx]['tax_name']} - ",
                                      textSecond:
                                          "${orderDetailData["tax_data"][idx]['tax_percentage']} %",
                                      color: ColorStyle.secondryColorBlack,
                                    )),

                          ],
                        )
                      ],
                    ),SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Total Amount",
                            style: TextStylesCustom.textStyles_14
                                .apply(fontWeightDelta: 3)),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "₹ " +
                                  orderDetailData['order_total_cost'].toString(),
                              style: TextStylesCustom.textStyles_14,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            if(orderDetailData["is_wallet"])
                            TextRichCustoms(
                              textFirst:
                              "Used Wallet Amount - ₹ ",
                              textSecond:
                              "${orderDetailData["wallet_amount"]} ",
                              color: ColorStyle.secondryColorBlack,
                            ),
                            if(orderDetailData["is_wallet"])
                            TextRichCustoms(
                              textFirst:
                              "Amount Paid - ₹ ",
                              textSecond:
                              "${orderDetailData["is_wallet"] ?  orderDetailData['order_total_cost'] - orderDetailData["wallet_amount"]:orderDetailData["wallet_amount"].toString()} ",
                              color: ColorStyle.secondryColorBlack,
                            )
                          ],
                        )
                      ],
                    )
                  ],
                )
              : Center(
                  child: Text(
                  "No Data Found",
                  style: TextStylesCustom.textStyles_26,
                )),
        )));
  }
}
