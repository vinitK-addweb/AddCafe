import 'package:addcafe/Styles/TextStyles.dart';
import 'package:addcafe/Views/Cart/cart.dart';
import 'package:addcafe/Views/MyHomePage.dart';
import 'package:flutter/material.dart';
import '../Components/ElevatedButtonCustom.dart';
import 'package:get/get.dart';
import 'package:addcafe/Views/EmptyWishlist.dart';
import 'package:addcafe/GetxController/Wishlist_controller.dart';

import '../Utils/Constant.dart';
import '../Styles/ColorStyle.dart';
import '../Components/AppBarStyle.dart';
import '../GetxController/MyHomePage_controller.dart';
import '../BottomNavBar.dart';
import '../Utils/Global.dart';
import '../Views/Categories/addons.dart';

import './../GetxController/Cart_controller.dart';

class Myfavourits extends StatelessWidget {
  Myfavourits({super.key});
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    // final userAuth = Provider.of<UserAuth>(context);
    // List<Wishlist> myFavouritesApi =
    //     Get.put(MyFavouritesApi().myFavourites.value);
    final myfavapi = Get.put(MyFavouritesApi());
    // final cartApi = Provider.of<CartApi>(context);
    // final cartData = Get.put(CartController());
    final homPageController = Get.put(HomeBannerController());
    final cartApi = Get.put(CartController());
    return GetBuilder(
        init: MyFavouritesApi(),
        initState: ((_) {
          myfavapi.initMethod();
        }),
        builder: (_) {
          return Obx(() {
            return Scaffold(
                key: _scaffoldKey,
                appBar: AppBarStyle(
                  backgroundColor: ColorStyle.primaryColorRed,
                  leading: IconButton(
                    onPressed: () => homPageController.currentIndex.value = 0,
                    icon: const Icon(
                      Icons.arrow_back,
                      size: 25,
                      color: Colors.white,
                    ),
                  ),
                  styleTitle: TextStylesCustom.textStyles_20,
                  title: 'Wishlist',
                ),
                // drawer: const MainDrawer(),
                bottomNavigationBar: cartApi.cartData.isNotEmpty
                    ? Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: InkWell(
                          onTap: (() => Get.to(Cart())),
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: ColorStyle.primaryColorRed,
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(15),
                                    topRight: Radius.circular(15))),
                            height: 60,
                            // child: ElevatedButton(
                            //   onPressed: () {
                            //     Navigator.of(context).pushNamed('/cart');
                            //   },
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${cartApi.cart['count']} ${cartApi.cartData.length > 1 ? 'ITEMS' : 'ITEM'}',
                                        style: TextStylesCustom.textStyles_11
                                            .apply(color: ColorStyle.white),
                                      ),
                                      const SizedBox(
                                        height: 4,
                                      ),
                                      Text(
                                        '₹ ${cartApi.cart['total_rate']}',
                                        style: TextStylesCustom.textStyles_14
                                            .apply(
                                                fontWeightDelta: 2,
                                                color: ColorStyle.white),
                                      )
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Next  >',
                                        style: TextStylesCustom.textStyles_16
                                            .apply(color: ColorStyle.white),
                                      )
                                    ],
                                  )
                                ]),
                          ),
                        ),
                      )
                    : Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 30),
                        child: ElevatedButtonCustom(
                          BgColor: ColorStyle.primaryColorRed,
                          size: const Size(50, 50),
                          text: 'Add Products',
                          onTap: () {
                            navigateMultiBottom(context, MyHomePage());
                          },
                        ),
                      ),
                body: myfavapi.myFavourites.isNotEmpty
                    ? SingleChildScrollView(
                        child: Column(
                          children: myfavapi.myFavourites.isNotEmpty
                              ? myfavapi.myFavourites.value.map((e) {
                                  //  List thisCartData = cartApi.isInCart(categoryItems[index]['id']);
                                  List thisCartData =
                                      cartApi.isInCart(e.product);
                                  return Container(
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    child: Card(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.5,
                                                child: Text(
                                                  '${e.productData?.itemName}',
                                                  style: TextStylesCustom
                                                      .textStyles_18
                                                      .apply(
                                                          fontWeightDelta: 2),
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                children: [
                                                  // Rating(3),
                                                  Text(
                                                    '345 reviews',
                                                    style: TextStylesCustom
                                                        .textStyles_16
                                                        .apply(
                                                            fontWeightDelta: 2),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Text('₹ ${e.productData?.price}',
                                                  style: TextStylesCustom
                                                      .textStyles_16),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                children: [
                                                  // <----------- Remove from wishlist ----------------->
                                                  InkWell(
                                                    onTap: () {
                                                      myfavapi
                                                          .deleteMyFavourites(
                                                              e.id);
                                                    },
                                                    child: Container(
                                                      margin: const EdgeInsets
                                                              .symmetric(
                                                          vertical: 10),
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 8,
                                                          vertical: 3),
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                          color: Colors.red,
                                                        ),
                                                      ),
                                                      child: const Text(
                                                        'Remove',
                                                        style: TextStyle(
                                                            color: Colors.red,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ),
                                                  ),

                                                  // Container(
                                                  //   margin: const EdgeInsets
                                                  //           .symmetric(
                                                  //       horizontal: 10),
                                                  //   child: const Icon(
                                                  //     Icons.share,
                                                  //     color: Colors.blueAccent,
                                                  //   ),
                                                  // ),
                                                ],
                                              )
                                            ],
                                          ),
                                          Stack(
                                            children: [
                                              SizedBox(
                                                width: 150,
                                                child: Column(
                                                  children: [
                                                    SizedBox(
                                                      width: 150,
                                                      height: 150,
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                        child: Image(
                                                          image: NetworkImage(
                                                              // '${dotenv.env['IMG_URL']}
                                                              '$kImgUrl/${e.productData?.featuredImage}'),
                                                          fit: BoxFit.fill,
                                                        ),
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 20,
                                                    )
                                                  ],
                                                ),
                                              ),
                                              Positioned(
                                                top: 120,
                                                left: 45,
                                                child: thisCartData.isEmpty
                                                    ? ElevatedButton(
                                                        onPressed: () => {
                                                          if ((e.productData!
                                                                  .addOnData!)
                                                              .isNotEmpty)
                                                            {
                                                              showModalBottomSheet(
                                                                isScrollControlled:
                                                                    true,
                                                                backgroundColor:
                                                                    Colors
                                                                        .transparent,
                                                                shape: const RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.vertical(
                                                                            top:
                                                                                Radius.circular(20))),
                                                                context:
                                                                    context,
                                                                builder: (context) =>
                                                                    AddonWishlist(
                                                                        e.productData),
                                                              )
                                                            }
                                                          else
                                                            {
                                                              cartApi
                                                                  .addToCart({
                                                                'item': e
                                                                    .productData!
                                                                    .id,
                                                                "addon": []
                                                              })
                                                            }
                                                        },
                                                        child: const Text(
                                                            'Add to cart'),
                                                      )
                                                    : Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          IconButton(
                                                            style: IconButton.styleFrom(
                                                                backgroundColor:
                                                                    ColorStyle
                                                                        .primaryColorRed),
                                                            color: Colors.white,
                                                            icon:
                                                                const CircleAvatar(
                                                                    radius: 14,
                                                                    child: Icon(
                                                                      Icons
                                                                          .remove,
                                                                      size: 20,
                                                                    )),
                                                            onPressed: () {
                                                              cartApi.updateQuantity(
                                                                  'minus',
                                                                  thisCartData[
                                                                          0]
                                                                      .id);

                                                              cartApi.update();
                                                            },
                                                          ),
                                                          Text(
                                                              thisCartData[0]
                                                                  .itemCount
                                                                  .toString(),
                                                              style: TextStylesCustom
                                                                  .textStyles_22
                                                                  .apply(
                                                                      color: ColorStyle
                                                                          .secondryColorBlack,
                                                                      fontWeightDelta:
                                                                          4)),
                                                          IconButton(
                                                            style: IconButton.styleFrom(
                                                                backgroundColor:
                                                                    ColorStyle
                                                                        .primaryColorRed),
                                                            // iconSize: 26,
                                                            color: Colors.white,
                                                            icon:
                                                                const CircleAvatar(
                                                                    radius: 14,
                                                                    child: Icon(
                                                                      Icons.add,
                                                                      size: 20,
                                                                    )),
                                                            onPressed: () {
                                                              cartApi.updateQuantity(
                                                                  'plus',
                                                                  thisCartData[
                                                                          0]
                                                                      .id);
                                                              cartApi.update();
                                                            },
                                                          ),
                                                        ],
                                                      ),

                                                // Container(
                                                //     width: 70,
                                                //     padding: EdgeInsets
                                                //         .symmetric(
                                                //             horizontal: 8,
                                                //             vertical: 8),
                                                //     decoration: BoxDecoration(
                                                //         color: Colors.red,
                                                //         border: Border.all(
                                                //             color:
                                                //                 Colors.red),
                                                //         borderRadius:
                                                //             BorderRadius
                                                //                 .all((Radius
                                                //                     .circular(
                                                //                         4)))),
                                                //     child: Row(
                                                //       mainAxisAlignment:
                                                //           MainAxisAlignment
                                                //               .spaceAround,
                                                //       children: [
                                                //         InkWell(
                                                //           onTap: () {
                                                //             if (e['item_count'] ==
                                                //                 1) {
                                                //               cartData
                                                //                   .delete(
                                                //                       e.id);
                                                //               return;
                                                //             }
                                                //             cartData.updateQuantity(
                                                //                 'minus',
                                                //                 thisCartData[
                                                //                         0]
                                                //                     ['id']);
                                                //           },
                                                //           child: Container(
                                                //             width: 20,
                                                //             child: Center(
                                                //               child: Text(
                                                //                 '-',
                                                //                 style: TextStyle(
                                                //                     color: Colors
                                                //                         .white),
                                                //               ),
                                                //             ),
                                                //           ),
                                                //         ),
                                                //         Text(
                                                //             '${thisCartData[0]['item_count']}',
                                                //             style: TextStyle(
                                                //                 color: Colors
                                                //                     .white)),
                                                //         InkWell(
                                                //           onTap: () {
                                                //             cartData.updateQuantity(
                                                //                 'plus',
                                                //                 thisCartData[
                                                //                         0]
                                                //                     ['id']);
                                                //           },
                                                //           child: Container(
                                                //             width: 20,
                                                //             child: Center(
                                                //               child: Text(
                                                //                 '+',
                                                //                 style: TextStyle(
                                                //                     color: Colors
                                                //                         .white),
                                                //               ),
                                                //             ),
                                                //           ),
                                                //         ),
                                                //       ],
                                                //     ),
                                                //   ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                }).toList()
                              : [const EmptyWishlist()],
                        ),
                      )
                    : const EmptyWishlist());
          });
        });
  }
}
