import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../BottomNavBar.dart';
import '../Components/AppBarStyle.dart';
import '../Components/ElevatedButtonCustom.dart';
import '../GetxController/Cart_controller.dart';
import '../Styles/ColorStyle.dart';
import '../Styles/TextStyles.dart';
import 'package:fdottedline_nullsafety/fdottedline__nullsafety.dart';

class OrderDetails extends StatelessWidget {
  OrderDetails({super.key});

  @override
  final controller = Get.put(CartController());
  Widget build(BuildContext context) {
    // controller.fetchCart();

    return Scaffold(
        appBar: AppBarStyle(
          styleTitle: TextStylesCustom.textStyles_20,
          elevation: 0,
          centerTitle: false,
          title: 'Order Details',
          backgroundColor: ColorStyle.primaryColorRed,
          leading: IconButton(
            onPressed: (() => Get.back()),
            icon: const Icon(
              Icons.arrow_back_ios_new_sharp,
              size: 20,
            ),
            color: Colors.white,
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: ImageIcon(
                      const AssetImage('assets/images/orderDetail.png'),
                      size: 100,
                      color: ColorStyle.secondryColorGreen,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Order Succesfully Placed",
                    style: TextStylesCustom.textStyles_20
                        .apply(fontWeightDelta: 3),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                    style: TextStylesCustom.textStyles_15,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    // margin: const EdgeInsets.symmetric(horizontal: 10),
                    padding: const EdgeInsets.only(bottom: 5),
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                width: 3, color: ColorStyle.primaryColorRed))),
                    child: Text("Track Your Order Here",
                        style: TextStylesCustom.textStyles_20
                            .apply(fontWeightDelta: 3)),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  FittedBox(
                    child: Row(children: [
                      // GridView.builder(
                      //   itemCount: 4,
                      //   shrinkWrap: true,
                      //   itemBuilder: (context, index) {
                      //     return Column(
                      //       children: [
                      //         CircleAvatar(
                      //           radius: 30,
                      //           backgroundColor: ColorStyle.primaryColorRed,
                      //           child: ImageIcon(
                      //               const AssetImage('assets/images/orderAccepted.png'),
                      //               size: 40,
                      //               color: ColorStyle.white),
                      //         ),
                      //         Text(data[index]['name'], textAlign: TextAlign.center),
                      //       ],
                      //     );
                      //   },
                      //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      //     crossAxisCount: 4,
                      //   ),
                      // )

                      // Container(
                      //   height: 50,
                      //   alignment: Alignment.centerLeft,
                      //   child: ListView.separated(
                      //       separatorBuilder: (BuildContext context, int index) {
                      //         return SizedBox(width: 3);
                      //       },
                      //       shrinkWrap: true,
                      //       itemCount: 4,
                      //       scrollDirection: Axis.horizontal,
                      //       itemBuilder: (BuildContext context, index) {
                      //         return Text(data[index]['name'],st);
                      //       }),
                      // )
                      // ])

                      CircleAvatar(
                        radius: 30,
                        backgroundColor: ColorStyle.primaryColorRed,
                        child: ImageIcon(
                            const AssetImage('assets/images/orderAccepted.png'),
                            size: 40,
                            color: ColorStyle.white),
                      ),
                      FDottedLine(
                        color: ColorStyle.primaryColorRed,
                        width: 55.0,
                        strokeWidth: 2.0,
                        dottedLength: 5.0,
                        space: 4.0,
                      ),
                      CircleAvatar(
                          radius: 31,
                          backgroundColor: ColorStyle.primaryColorRed,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(60),
                            child: CircleAvatar(
                              radius: 30,
                              backgroundColor: ColorStyle.primaryColorRed,
                              child: ImageIcon(
                                const AssetImage('assets/images/preparing.png'),
                                size: 40,
                                color: ColorStyle.white,
                              ),
                            ),
                          )),
                      FDottedLine(
                        color: ColorStyle.primaryColorRed,
                        width: 55.0,
                        strokeWidth: 2.0,
                        dottedLength: 5.0,
                        space: 4.0,
                      ),
                      CircleAvatar(
                          radius: 31,
                          backgroundColor: ColorStyle.primaryColorRed,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(60),
                            child: CircleAvatar(
                              radius: 30,
                              backgroundColor: ColorStyle.white,
                              child: ImageIcon(
                                const AssetImage(
                                    'assets/images/outForDelivery.png'),
                                size: 40,
                                color: ColorStyle.primaryColorRed,
                              ),
                            ),
                          )),
                      FDottedLine(
                        color: ColorStyle.primaryColorRed,
                        width: 55.0,
                        strokeWidth: 2.0,
                        dottedLength: 5.0,
                        space: 4.0,
                      ),
                      CircleAvatar(
                          radius: 31,
                          backgroundColor: ColorStyle.primaryColorRed,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(60),
                            child: CircleAvatar(
                              radius: 30,
                              backgroundColor: ColorStyle.white,
                              child: ImageIcon(
                                const AssetImage('assets/images/Delivered.png'),
                                size: 40,
                                color: ColorStyle.primaryColorRed,
                              ),
                            ),
                          )),
                      const SizedBox(
                        width: 10,
                      )
                      //   ],
                      // ),
                      // ),
                      // CircleAvatar(
                      //   radius: 25,
                      //   backgroundColor: ColorStyle.primaryColorRed,
                      //   child: ImageIcon(AssetImage('assets/images/orderAccepted.png'),
                      //       size: 30, color: ColorStyle.white),
                      // ),
                      // FDottedLine(
                      //   color: ColorStyle.primaryColorRed,
                      //   height: 60.0,
                      //   strokeWidth: 2.0,
                      //   dottedLength: 10.0,
                      //   space: 5.0,
                      // ),
                      // CircleAvatar(
                      //   radius: 25,
                      //   backgroundColor: ColorStyle.primaryColorRed,
                      //   child: ImageIcon(AssetImage('assets/images/orderAccepted.png'),
                      //       size: 30, color: ColorStyle.white),
                      // ),
                      // FDottedLine(
                      //   color: ColorStyle.primaryColorRed,
                      //   height: 65.0,
                      //   strokeWidth: 2.0,
                      //   dottedLength: 8.0,
                      //   space: 8.0,
                      // ),
                      // CircleAvatar(
                      //   radius: 25,
                      //   backgroundColor: ColorStyle.primaryColorRed,
                      //   child: ImageIcon(AssetImage('assets/images/orderAccepted.png'),
                      //       size: 30, color: ColorStyle.white),
                      // ),
                      // FDottedLine(
                      //   color: ColorStyle.primaryColorRed,
                      //   height: 75.0,
                      //   strokeWidth: 2.0,
                      //   dottedLength: 10.0,
                      //   space: 8.0,
                      // ),
                      // CircleAvatar(
                      //   radius: 25,
                      //   backgroundColor: ColorStyle.primaryColorRed,
                      //   child: ImageIcon(AssetImage('assets/images/orderAccepted.png'),
                      //       size: 30, color: ColorStyle.white),
                      // ),
                    ]),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  FittedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                            width: 100,
                            child: Text(
                              "Order Accepted",
                              style: TextStylesCustom.textStyles_10,
                            )),
                        const SizedBox(
                          width: 5,
                        ),
                        SizedBox(
                            width: 110,
                            child: Text(
                              "Preparing Your Food In The Kitchen",
                              style: TextStylesCustom.textStyles_10,
                              textAlign: TextAlign.center,
                            )),
                        const SizedBox(
                          width: 5,
                        ),
                        SizedBox(
                            width: 110,
                            child: Text(
                              "Out For Delivery/Coming To Your Table",
                              style: TextStylesCustom.textStyles_10,
                              textAlign: TextAlign.center,
                            )),
                        const SizedBox(
                          width: 5,
                        ),
                        SizedBox(
                            width: 110,
                            child: Text(
                              "Delivered,Enjoy your Food !!",
                              style: TextStylesCustom.textStyles_10,
                              textAlign: TextAlign.center,
                            )),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco.",
                    style: TextStylesCustom.textStyles_15,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton.icon(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                ColorStyle.primaryColorGreen)),

                        onPressed: () {},
                        icon: const Icon(
                          // <-- Icon
                          Icons.download,
                          size: 20.0,
                        ),
                        // : ColorStyle.secondryColorGreen,
                        label: Text(
                          'Download Invoice',
                          style: TextStylesCustom.textStyles_13,
                        ), // <-- Text
                      ),
                      ElevatedButtonCustom(
                        onTap: (() {}),
                        text: 'Cancel Order',
                        BgColor: ColorStyle.primaryColorRed,
                        size: const Size(130, 35),
                        radiusBorder: 5,
                      )
                    ],
                  ),
                ]),
          ),
        ));
  }
}
