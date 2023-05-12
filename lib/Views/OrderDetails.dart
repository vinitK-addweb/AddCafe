import 'package:get/get.dart';
import '../BottomNavBar.dart';
import '../Styles/ColorStyle.dart';
import '../Styles/TextStyles.dart';
import 'package:flutter/material.dart';
import '../Components/AppBarStyle.dart';
import '../GetxController/Cart_controller.dart';
import '../Components/ElevatedButtonCustom.dart';
import 'package:fdottedline_nullsafety/fdottedline__nullsafety.dart';

class OrderDetails extends StatefulWidget {
  OrderDetails({super.key});

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  final controller = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    ;

    return Scaffold(
        appBar: AppBarStyle(
          styleTitle: TextStylesCustom.textStyles_20,
          elevation: 0,
          centerTitle: false,
          title: 'Order Details',
          backgroundColor: ColorStyle.primaryColorRed,
          leading: IconButton(
            onPressed: (() => Get.to(() => BottamNavigationBar())),
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
                          Icons.download,
                          size: 20.0,
                        ),
                        label: Text(
                          'Download Invoice',
                          style: TextStylesCustom.textStyles_13,
                        ),
                      ),
                      ElevatedButtonCustom(
                        onTap: (() {}),
                        text: 'Cancel Order',
                        BgColor: ColorStyle.primaryColorRed,
                        size: const Size(140, 35),
                        radiusBorder: 5,
                      )
                    ],
                  ),
                ]),
          ),
        ));
  }
}
