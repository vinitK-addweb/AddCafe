import 'package:addcafe/Views/Faq.dart';
import 'package:addcafe/Views/MyHomePage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:addcafe/GetxController/UserAuth_controller.dart';
import '../Utils/Global.dart';
import '../Views/Cart/cart.dart';
import '../Views/PrivacyPolicy.dart';
import '../Views/Wishlist.dart';
import '../Views/userProfile.dart';
import '../Styles/TextStyles.dart';
import '../Styles/ColorStyle.dart';
import '../Components/ElevatedButtonCustom.dart';
import '../Views/Offers.dart';

class MyDrowerList extends StatelessWidget {
  final userAuth = Get.put(UserAuth());
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: UserAuth(),
        initState: (_) {
          userAuth.userprofile;
        },
        builder: (userAuth) {
          return Obx(() {
            return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Card(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // InkWell(
                      //   onTap: () {
                      //     Get.to(MyHomePage());
                      //   },
                      //   child: Container(
                      //     padding: EdgeInsets.all(20.0),
                      //     child: Row(
                      //         crossAxisAlignment: CrossAxisAlignment.start,
                      //         children: [
                      //           Icon(
                      //             Icons.home_outlined,
                      //             size: 30,
                      //             color: ColorStyle.secondaryColorgrey,
                      //           ),
                      //           Container(
                      //             margin: EdgeInsets.only(left: 20),
                      //             child: Text('Home',
                      //                 style: TextStylesCustom.textStyles_20.apply(
                      //                   color: ColorStyle.secondaryColorgrey,
                      //                 )),
                      //           ),
                      //         ]),
                      //   ),
                      // ),
                      InkWell(
                        onTap: (() =>
                            navigateMultiBottom(context, UserProfile())),
                        child: Container(
                          padding: const EdgeInsets.all(20.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.person_outline,
                                  size: 30,
                                  color: ColorStyle.secondaryColorgrey,
                                ),
                                Container(
                                  margin: const EdgeInsets.only(left: 20),
                                  child: Text(
                                    'Profile',
                                    style: TextStylesCustom.textStyles_20.apply(
                                        color: ColorStyle.secondaryColorgrey),
                                  ),
                                ),
                              ]),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(() => Cart());

                          // Get.to(Myfavourits());
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Row(children: [
                            Icon(
                              Icons.shopping_cart,
                              size: 30,
                              color: ColorStyle.secondaryColorgrey,
                            ),
                            Container(
                              margin: const EdgeInsets.only(left: 20),
                              child: Text(
                                'Cart',
                                style: TextStylesCustom.textStyles_20.apply(
                                    color: ColorStyle.secondaryColorgrey),
                              ),
                            ),
                          ]),
                        ),
                      ),
                      // InkWell(
                      //   onTap: () =>
                      //       navigateMultiBottom(context, const Offers()),
                      //   // Get.to(Offers()),
                      //   child: Padding(
                      //     padding: const EdgeInsets.all(20.0),
                      //     child: Row(children: [
                      //       Icon(
                      //         Icons.discount_outlined,
                      //         size: 30,
                      //         color: ColorStyle.secondaryColorgrey,
                      //       ),
                      //       Container(
                      //         margin: const EdgeInsets.only(left: 20),
                      //         child: Text(
                      //           'Offers',
                      //           style: TextStylesCustom.textStyles_20.apply(
                      //             color: ColorStyle.secondaryColorgrey,
                      //           ),
                      //         ),
                      //       ),
                      //     ]),
                      //   ),
                      // ),
                      InkWell(
                        onTap: () => navigateMultiBottom(context, Faq()),

                        // Get.to(Faq()),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Row(children: [
                            Icon(
                              Icons.question_answer_outlined,
                              size: 30,
                              color: ColorStyle.secondaryColorgrey,
                            ),
                            Container(
                              margin: const EdgeInsets.only(left: 20),
                              child: Text(
                                'Faqs',
                                style: TextStylesCustom.textStyles_20.apply(
                                  color: ColorStyle.secondaryColorgrey,
                                ),
                              ),
                            ),
                          ]),
                        ),
                      ),
                      InkWell(
                        onTap: () =>
                            navigateMultiBottom(context, PrivacyPolicy()),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Row(children: [
                            Icon(
                              Icons.settings,
                              size: 30,
                              color: ColorStyle.secondaryColorgrey,
                            ),
                            Container(
                              margin: const EdgeInsets.only(left: 20),
                              child: Text(
                                'Privacy Policy',
                                style: TextStylesCustom.textStyles_20.apply(
                                  color: ColorStyle.secondaryColorgrey,
                                ),
                              ),
                            ),
                          ]),
                        ),
                      ),
                      userAuth.userprofile.isNotEmpty
                          ? Column(children: [
                              Center(
                                child: ElevatedButtonCustom(
                                  BgColor: ColorStyle.primaryColorRed,
                                  size: Size(
                                      MediaQuery.of(context).size.width / 1.5,
                                      50),
                                  onTap: () {
                                    scaffoldKey.currentState?.closeDrawer();
                                    userAuth.logOut();
                                  },
                                  text: 'LogOut',
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              )
                            ]
                              //  ElevatedButton(
                              //     onPressed: () => userAuth.logOut(),
                              //     child: Text('Log Out',
                              //         style: TextStylesCustom.textStyles_20.apply(
                              //           color: ColorStyle.secondryColorBlack,
                              //         )))
                              )
                          : SizedBox(
                              height: 0,
                              child: Text(userAuth.userprofile.isNotEmpty
                                  ? 'true'
                                  : 'false'),
                            )
                    ],
                  )),
                  // Card(
                  //     child: Column(
                  //   crossAxisAlignment: CrossAxisAlignment.start,
                  //   children: [
                  //     InkWell(
                  //       child: Container(
                  //         padding: EdgeInsets.all(10.0),
                  //         child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  //           Icon(
                  //             Icons.map_sharp,
                  //             size: 30,
                  //             color: ColorStyle.secondaryColorgrey,
                  //           ),
                  //           Container(
                  //             margin: EdgeInsets.only(left: 40),
                  //             child: Text(
                  //               'Track Order',
                  //               style: TextStyle(color: ColorStyle.secondaryColorgrey, fontSize: 20),
                  //             ),
                  //           ),
                  //         ]),
                  //       ),
                  //     ),
                  //     InkWell(
                  //       child: Container(
                  //         padding: EdgeInsets.all(10.0),
                  //         child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  //           Icon(
                  //             Icons.local_pizza_sharp,
                  //             size: 30,
                  //             color: Colors.grey,
                  //           ),
                  //           Container(
                  //             margin: EdgeInsets.only(left: 40),
                  //             child: Text(
                  //               'Order History',
                  //               style: TextStyle(color: Colors.grey, fontSize: 20),
                  //             ),
                  //           ),
                  //         ]),
                  //       ),
                  //     ),
                  //     InkWell(
                  //       child: Padding(
                  //         padding: EdgeInsets.all(10.0),
                  //         child: Row(children: [
                  //           Icon(
                  //             Icons.wallet,
                  //             size: 30,
                  //             color: Colors.grey,
                  //           ),
                  //           Container(
                  //             margin: EdgeInsets.only(left: 40),
                  //             child: Text(
                  //               'Wallet',
                  //               style: TextStyle(color: Colors.grey, fontSize: 20),
                  //             ),
                  //           ),
                  //         ]),
                  //       ),
                  //     ),
                  //   ],
                  // )),
                  // Card(
                  //     child: Column(
                  //   crossAxisAlignment: CrossAxisAlignment.start,
                  //   children: [
                  //     InkWell(
                  //       child: Container(
                  //         padding: EdgeInsets.all(10.0),
                  //         child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  //           Icon(
                  //             Icons.language_sharp,
                  //             size: 30,
                  //             color: Colors.grey,
                  //           ),
                  //           Container(
                  //             margin: EdgeInsets.only(left: 40),
                  //             child: Text(
                  //               'Change Language',
                  //               style: TextStyle(color: Colors.grey, fontSize: 20),
                  //             ),
                  //           ),
                  //         ]),
                  //       ),
                  //     ),
                  //     InkWell(
                  //       child: Container(
                  //         padding: EdgeInsets.all(10.0),
                  //         child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  //           Icon(
                  //             Icons.feedback,
                  //             size: 30,
                  //             color: Colors.grey,
                  //           ),
                  //           Container(
                  //             margin: EdgeInsets.only(left: 40),
                  //             child: Text(
                  //               'Feedback',
                  //               style: TextStyle(color: Colors.grey, fontSize: 20),
                  //             ),
                  //           ),
                  //         ]),
                  //       ),
                  //     ),
                  //     InkWell(
                  //       child: Padding(
                  //         padding: EdgeInsets.all(10.0),
                  //         child: Row(children: [
                  //           Icon(
                  //             Icons.feed_sharp,
                  //             size: 30,
                  //             color: Colors.grey,
                  //           ),
                  //           Container(
                  //             margin: EdgeInsets.only(left: 40),
                  //             child: Text(
                  //               'Terms & Conditions',
                  //               style: TextStyle(color: Colors.grey, fontSize: 20),
                  //             ),
                  //           ),
                  //         ]),
                  //       ),
                  //     ),
                  //     InkWell(
                  //       child: Padding(
                  //         padding: EdgeInsets.all(10.0),
                  //         child: Row(children: [
                  //           Icon(
                  //             Icons.headphones,
                  //             size: 30,
                  //             color: Colors.grey,
                  //           ),
                  //           Container(
                  //             margin: EdgeInsets.only(left: 40),
                  //             child: Text(
                  //               'Contact Us',
                  //               style: TextStyle(color: Colors.grey, fontSize: 20),
                  //             ),
                  //           ),
                  //         ]),
                  //       ),
                  //     ),
                  //   ],
                  // )),
                ]);
          });
        });
  }
}
