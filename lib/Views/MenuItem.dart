import 'dart:core';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Components/AppBarStyle.dart';
import '../GetxController/Cart_controller.dart';
import '../GetxController/MenuItems_controller.dart';

import '../GetxController/searchResult_controller.dart';
import '../Styles/ColorStyle.dart';
import '../Styles/TextStyles.dart';
import 'Cart/cart.dart';
import 'Categories/addons.dart';
import 'Categories/rating.dart';
import 'SearchResult.dart';

class MenuItems extends StatelessWidget {
  MenuItems({Key? key, required this.cuisineId, required this.categoryId})
      : super(key: key);

  final cuisineId;
  final categoryId;
  final cart = Get.find<CartController>();
  final controller = Get.put(MenuItemsController());
  final cartApi = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: MenuItemsController(),
      initState: (_) {
        controller.initFunction();
        controller.categoryId.value = categoryId.toString();
        controller.cuisineId.value = cuisineId.toString();
      },
      builder: (_) {
        return Obx(() {
          return Scaffold(
            appBar: AppBarStyle(
              backgroundColor: ColorStyle.primaryColorRed,
              trailings: [
                controller.search.value
                    ? IconButton(
                        onPressed: () {},
                        icon: IconButton(
                          iconSize: 30,
                          onPressed: () {
                            Get.find<SearchResultController>()
                                .itemName
                                .value
                                .text = '';

                            controller.search.value = false;
                            Get.find<SearchResultController>()
                                .searchResult
                                .value = [];
                          },
                          icon: const Icon(Icons.close),
                        ))
                    : const SizedBox(
                        height: 0,
                        width: 50,
                      )
              ],
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
              title: 'Menu Items ',
            ),
            bottomNavigationBar: cart.cartData.isNotEmpty
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
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${cart.cart['count']} ${cart.cartData.length > 1 ? 'ITEMS' : 'ITEM'}',
                                    style: TextStylesCustom.textStyles_11
                                        .apply(color: ColorStyle.white),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    '₹ ${cart.cart['total_rate']}',
                                    style: TextStylesCustom.textStyles_14.apply(
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
                : const SizedBox(
                    height: 0,
                  ),
            body: Column(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                      controller:
                          Get.find<SearchResultController>().itemName.value,
                      onChanged: (value) {
                        Get.find<SearchResultController>().initfunction();
                      },
                      onTap: (() {
                        controller.search.value = true;
                      }),
                      decoration: InputDecoration(
                        hintText: "Search Your Favourite Food Here", //hint text
                        prefixIcon: const Icon(Icons.search), //prefix iocn
                        hintStyle: TextStylesCustom.textStyles_16.apply(
                            color:
                                ColorStyle.secondryColorBlack.withOpacity(0.5)),
                      )),
                ),
                const SizedBox(
                  height: 5,
                ),
                Wrap(
                  runSpacing: 5.0,
                  direction: Axis.horizontal,
                  spacing: 10,
                  children: [
                    InkWell(
                      onTap: () {
                        if (controller.veg.value == 1) {
                          controller.veg.value = 0;
                        } else
                          controller.veg.value = 1;
                      },
                      child: Container(
                          // margin: EdgeInsets.symmetric(vertical: 10),
                          height: 30,
                          width: 100,
                          decoration: BoxDecoration(
                            color: Colors.white60,
                            border: Border.all(
                                color: controller.veg == 1
                                    ? Colors.greenAccent
                                    : Colors.transparent,
                                width: 2.0,
                                style: BorderStyle.solid),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                'Veg',
                                textAlign: TextAlign.center,
                                style: TextStylesCustom.textStyles_14
                                    .apply(fontWeightDelta: 3),
                              ))),
                    ),
                    InkWell(
                      onTap: () {
                        if (controller.veg.value == 2) {
                          controller.veg.value = 0;
                        } else
                          controller.veg.value = 2;
                      },
                      child: Container(
                          height: 30,
                          width: 100,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: controller.veg == 2
                                    ? Colors.redAccent
                                    : Colors.transparent,
                                width: 2.0,
                                style: BorderStyle.solid),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                'Non Veg',
                                textAlign: TextAlign.center,
                                style: TextStylesCustom.textStyles_14
                                    .apply(fontWeightDelta: 3),
                              ))),
                    ),
                    InkWell(
                      onTap: () {
                        if (controller.lowToHigh.value == 1) {
                          controller.lowToHigh.value = 0;
                        } else
                          controller.lowToHigh.value = 1;
                      },
                      child: Container(
                          height: 30,
                          width: 120,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: controller.lowToHigh == 1
                                    ? Colors.grey
                                    : Colors.transparent,
                                width: 2.0,
                                style: BorderStyle.solid),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                'Low to High',
                                textAlign: TextAlign.center,
                                style: TextStylesCustom.textStyles_14
                                    .apply(fontWeightDelta: 3),
                              ))),
                    ),
                    InkWell(
                      onTap: () {
                        if (controller.lowToHigh.value == 2) {
                          controller.lowToHigh.value = 0;
                        } else
                          controller.lowToHigh.value = 2;
                      },
                      child: Container(
                          // margin: EdgeInsets.symmetric(vertical: 10),
                          height: 30,
                          width: 120,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: controller.lowToHigh == 2
                                    ? Colors.grey
                                    : Colors.transparent,
                                width: 2.0,
                                style: BorderStyle.solid),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                'High to Low ',
                                textAlign: TextAlign.center,
                                style: TextStylesCustom.textStyles_14
                                    .apply(fontWeightDelta: 3),
                              ))),
                    ),
                  ],
                ),

                const SizedBox(
                  height: 20,
                ),

                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: controller.search.value
                        ? SingleChildScrollView(child: SearchResult())
                        : Column(
                            children: [
                              // Card(
                              //   child: Row(
                              //     mainAxisAlignment:
                              //         MainAxisAlignment.spaceBetween,
                              //     children: [
                              //       Text("View all ",
                              //           style: TextStylesCustom.textStyles_15
                              //               .apply(fontWeightDelta: 3)),
                              //       IconButton(
                              //           onPressed: () {},
                              //           icon: Icon(Icons.arrow_drop_down))
                              //     ],
                              //   ),
                              // ),
                              controller.menuCategory.isNotEmpty
                                  ? Expanded(
                                      child: ListView.builder(
                                          shrinkWrap: true,
                                          itemCount:
                                              controller.menuCategory.length,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return Card(
                                              child: Column(
                                                children: [
                                                  InkWell(
                                                    onTap: () {
                                                      if (controller.cuisineId
                                                              .value ==
                                                          controller
                                                              .menuCategory[
                                                                  index]['id']
                                                              .toString()) {
                                                        controller.cuisineId
                                                            .value = "";
                                                        controller.update();
                                                      } else {
                                                        controller.cuisineId
                                                                .value =
                                                            controller
                                                                .menuCategory[
                                                                    index]['id']
                                                                .toString();

                                                        controller.update();
                                                      }
                                                      controller.getCategoryData(
                                                          controller
                                                                  .menuCategory[
                                                              index]['id']);
                                                    },
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          controller
                                                                  .menuCategory[
                                                              index]['name'],
                                                          style: TextStylesCustom
                                                              .textStyles_15
                                                              .apply(
                                                                  fontWeightDelta:
                                                                      3),
                                                        ),
                                                        IconButton(
                                                            onPressed: () {
                                                              if (controller
                                                                      .cuisineId
                                                                      .value ==
                                                                  controller
                                                                      .menuCategory[
                                                                          index]
                                                                          ['id']
                                                                      .toString()) {
                                                                controller
                                                                    .cuisineId
                                                                    .value = "";
                                                                controller
                                                                    .update();
                                                              } else {
                                                                controller
                                                                    .cuisineId
                                                                    .value = controller
                                                                        .menuCategory[
                                                                    index]['id'];
                                                                controller
                                                                    .update();
                                                              }
                                                            },
                                                            icon: Icon(controller
                                                                        .cuisineId
                                                                        .value ==
                                                                    controller
                                                                        .menuCategory[
                                                                            index]
                                                                            [
                                                                            'id']
                                                                        .toString()
                                                                ? Icons
                                                                    .arrow_drop_up
                                                                : Icons
                                                                    .arrow_drop_down))
                                                      ],
                                                    ),
                                                  ),
                                                  Obx(() =>
                                                  controller.cuisineId.value !=
                                                          controller
                                                              .menuCategory[index]
                                                                  ['id']
                                                              .toString()
                                                      ? SizedBox(
                                                          height: 0,
                                                        )
                                                      : ListView.separated(
                                                          separatorBuilder:
                                                              (context, index) =>
                                                                  Divider(
                                                                    color: Colors
                                                                        .grey,
                                                                  ),
                                                          itemCount: controller
                                                              .menuItems.length,
                                                          shrinkWrap: true,
                                                          physics:
                                                              ClampingScrollPhysics(),
                                                          itemBuilder:
                                                              (BuildContext
                                                                      context,
                                                                  int index) {
                                                            return Column(
                                                              children: [
                                                                InkWell(
                                                                  onTap: () {
                                                                    controller
                                                                        .products
                                                                        .value = [];
                                                                    controller
                                                                        .categoryId
                                                                        .value = controller.menuItems[
                                                                            index]
                                                                            [
                                                                            'id']
                                                                        .toString();
                                                                    controller.getProducts(
                                                                        controller.menuItems[index]
                                                                            [
                                                                            'id']);
                                                                  },
                                                                  child: Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Text(
                                                                        controller.menuItems[index]
                                                                            [
                                                                            'name'],
                                                                        style: TextStylesCustom
                                                                            .textStyles_15
                                                                            .apply(
                                                                          color:
                                                                              ColorStyle.secondaryColorgrey,
                                                                        ),
                                                                      ),
                                                                      IconButton(
                                                                          onPressed:
                                                                              () {},
                                                                          icon: Icon(controller.categoryId.value == controller.menuItems[index]['id'].toString()
                                                                              ? Icons.arrow_drop_up
                                                                              : Icons.arrow_drop_down))
                                                                    ],
                                                                  ),
                                                                ),
                                                                controller.categoryId
                                                                            .value !=
                                                                        controller
                                                                            .menuItems[index][
                                                                                'id']
                                                                            .toString()
                                                                    ? SizedBox(
                                                                        height:
                                                                            0,
                                                                      )
                                                                    : controller
                                                                            .products
                                                                            .isEmpty
                                                                        ? Text(
                                                                            "No Item Found",
                                                                            style:
                                                                                TextStylesCustom.textStyles_14.apply(fontWeightDelta: 3),
                                                                          )
                                                                        : ListView.builder(
                                                                            itemCount: controller.products.length,
                                                                            physics: const NeverScrollableScrollPhysics(),
                                                                            shrinkWrap: true,
                                                                            itemBuilder: (context, index) {
                                                                              List thisCartData = cartApi.isInCart(controller.products[index]['id']);
                                                                              return Container(
                                                                                margin: const EdgeInsets.symmetric(vertical: 10),
                                                                                child: Card(
                                                                                  child: Row(
                                                                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                                    children: [
                                                                                      Expanded(
                                                                                        child: Column(
                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                          children: [
                                                                                            const SizedBox(
                                                                                                width: 20,
                                                                                                child: Image(
                                                                                                  image: AssetImage('assets/images/vegIcon.png'),
                                                                                                  fit: BoxFit.fill,
                                                                                                )),
                                                                                            const SizedBox(
                                                                                              height: 10,
                                                                                            ),
                                                                                            SizedBox(
                                                                                              width: MediaQuery.of(context).size.width * 0.5,
                                                                                              child: Text(
                                                                                                '${controller.products[index]['item_name']}',
                                                                                                style: TextStylesCustom.textStyles_18.apply(fontWeightDelta: 3),
                                                                                              ),
                                                                                            ),
                                                                                            const SizedBox(
                                                                                              height: 10,
                                                                                            ),
                                                                                            Row(
                                                                                              children: [
                                                                                                Rating(3),
                                                                                                Text(
                                                                                                  '345 reviews',
                                                                                                  style: TextStylesCustom.textStyles_15.apply(fontWeightDelta: 2),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                            const SizedBox(
                                                                                              height: 10,
                                                                                            ),
                                                                                            Text('₹ ${controller.products[index]['price']}', style: TextStylesCustom.textStyles_16),
                                                                                            const SizedBox(
                                                                                              height: 10,
                                                                                            ),
                                                                                          ],
                                                                                        ),
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
                                                                                                    borderRadius: BorderRadius.circular(8),
                                                                                                    child: Image(
                                                                                                      image: NetworkImage('${controller.products[index]['featured_image']}'),
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
                                                                                            left: 0,
                                                                                            right: 0,
                                                                                            child: thisCartData.isEmpty
                                                                                                ? ElevatedButton(
                                                                                                    onPressed: () => {
                                                                                                      if ((controller.products[index]['add_on_data'] as List).isNotEmpty)
                                                                                                        {
                                                                                                          showModalBottomSheet(
                                                                                                            isScrollControlled: true,
                                                                                                            backgroundColor: Colors.transparent,
                                                                                                            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
                                                                                                            context: context,
                                                                                                            builder: (context) => Addon(controller.products[index]),
                                                                                                          )
                                                                                                        }
                                                                                                      else
                                                                                                        {
                                                                                                          cartApi.addToCart({
                                                                                                            'item': controller.products[index]['id'],
                                                                                                            "addon": []
                                                                                                          })
                                                                                                        }
                                                                                                    },
                                                                                                    child: Text('Add'),
                                                                                                  )
                                                                                                : Row(
                                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                                    children: [
                                                                                                      IconButton(
                                                                                                        style: IconButton.styleFrom(backgroundColor: ColorStyle.primaryColorRed),
                                                                                                        color: Colors.white,
                                                                                                        icon: const CircleAvatar(
                                                                                                            radius: 14,
                                                                                                            child: Icon(
                                                                                                              Icons.remove,
                                                                                                              size: 20,
                                                                                                            )),
                                                                                                        onPressed: () {
                                                                                                          cartApi.updateQuantity('minus', thisCartData[0].id);

                                                                                                          cartApi.update();
                                                                                                        },
                                                                                                      ),
                                                                                                      Text(thisCartData[0].itemCount.toString(), style: TextStylesCustom.textStyles_22.apply(color: ColorStyle.secondryColorBlack, fontWeightDelta: 4)),
                                                                                                      IconButton(
                                                                                                        style: IconButton.styleFrom(backgroundColor: ColorStyle.primaryColorRed),
                                                                                                        color: Colors.white,
                                                                                                        icon: const CircleAvatar(
                                                                                                            radius: 14,
                                                                                                            child: Icon(
                                                                                                              Icons.add,
                                                                                                              size: 20,
                                                                                                            )),
                                                                                                        onPressed: () {
                                                                                                          cartApi.updateQuantity('plus', thisCartData[0].id);
                                                                                                          cartApi.update();
                                                                                                        },
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                          ),
                                                                                        ],
                                                                                      )
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            })
                                                              ],
                                                            );
                                                          }), )
                                                  //
                                                ],
                                              ),
                                            );
                                          }),
                                    )
                                  : Text("Loading ......"),
                            ],
                          ),
                  ),
                )

                // controller.cuisineFilter.isNotEmpty ?
//                         Expanded(
//                           child: ListView.builder(
//                               itemCount: controller.cuisineFilter.length,
//                               shrinkWrap: true,
//                               itemBuilder: (BuildContext context, int index) {
//                                 return
// //
//                                   Container(
//                                       margin: EdgeInsets.symmetric(
//                                           vertical: 20),
//                                       width: MediaQuery
//                                           .of(context)
//                                           .size
//                                           .width,
//                                       height: 220,
//                                       decoration: BoxDecoration(
//                                         image: DecorationImage(
//                                           colorFilter: new ColorFilter.mode(
//                                               Colors.black.withOpacity(0.8),
//                                               BlendMode.dstATop),
//                                           fit: BoxFit.fill,
//                                           image: NetworkImage(controller
//                                               .cuisineFilter[index]['image']),
//                                         ),
//                                       ),
//                                       alignment: Alignment.bottomCenter,
//                                       // This aligns the child of the container
//                                       child: Padding(
//                                           padding: EdgeInsets.only(
//                                               bottom: 10.0),
//                                           //some spacing to the child from bottom
//                                           child: Container(
//                                               decoration: BoxDecoration(
//                                                 color: Colors.white,
//                                                 borderRadius: BorderRadius
//                                                     .circular(8),
//                                               ),
//
//                                               padding: EdgeInsets.all(5),
//
//                                               child: Text(controller
//                                                   .cuisineFilter[index]['name']
//                                                   .toString(), style: TextStyle(
//                                                   color: Colors.black,
//                                                   fontWeight: FontWeight.bold)))
//                                       )
//                                   );
//                               }),
//                         ) : Center(child: Text("No Item Found",style: TextStylesCustom.textStyles_26,)),
                //   ],),
                // ),
                // Text(controller.cuisineFilter .toString())
              ],
            ),
          );
        });
      },
    );
  }
}
