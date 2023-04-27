import 'dart:core';
import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Components/AppBarStyle.dart';
import '../GetxController/Cart_controller.dart';
import '../GetxController/MyHomePage_controller.dart';
import '../GetxController/ViewMore_controller.dart';
import '../Styles/ColorStyle.dart';
import '../Styles/TextStyles.dart';
import 'Cart/cart.dart';
import 'MenuItem.dart';

class ViewMore extends StatelessWidget {
  ViewMore({Key? key}) : super(key: key);
final cart = Get.find<CartController >();
final controller = Get.put(ViewMoreController());
  @override
  Widget build(BuildContext context) {
    return
      GetBuilder(
        init: ViewMoreController(),
        initState: controller.initFunction(),
        builder: (_) {
          return
            Obx(() {
              return
                Scaffold(
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
                      title: 'Menu',
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
                        : const SizedBox(
                      height: 0,
                    ),
                    body:
                    Container(child: Column(
                      children: [
                        Wrap(
                          direction: Axis.horizontal,
                          spacing: 10,

                          children: [


                            InkWell(
                              onTap: () {
                                controller.currentIndex.value = 0;
                                controller.getCuisineFilter('');
                              },
                              child: Container(
                                  height: 30,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    border: Border(

                                      bottom: BorderSide(width: 3.0,
                                        color: controller.currentIndex == 0
                                            ? Colors.greenAccent
                                            : Colors.transparent,),
                                    ),

                                  ),
                                  child: Align(alignment: Alignment.center,
                                      child: Text(
                                        'View All', textAlign: TextAlign.center,
                                        style: TextStylesCustom.textStyles_14
                                            .apply(fontWeightDelta: 3),))),
                            ),
                            // ),
                            ... List.generate(controller.cuisineData.length, (
                                index) =>


                            controller.cuisineData.isNotEmpty ?
                            InkWell(
                              onTap: () {
                                controller.currentIndex.value =
                                controller.cuisineData[index]['id'];
                                controller.getCuisineFilter(
                                    controller.cuisineData[index]['id']);
                              },
                              child: Container(
                                  height: 35,
                                  width: 80,
                                  decoration: BoxDecoration(
                                    border: Border(

                                      bottom: BorderSide(width: 3.0,
                                        color: controller.currentIndex ==
                                            controller.cuisineData[index]['id']
                                            ? Colors.greenAccent
                                            : Colors.transparent,),
                                    ),

                                  ),
                                  child: Align(alignment: Alignment.center,
                                      child: Text(
                                        controller.cuisineData[index]['name'],
                                        textAlign: TextAlign.center,
                                        style: TextStylesCustom.textStyles_14
                                            .apply(fontWeightDelta: 3),))),
                            ) : Text(""),
                            )
                            // )
                          ],),
                        controller.cuisineFilter.isNotEmpty ?
                        Expanded(
                          child: ListView.builder(
                              itemCount: controller.cuisineFilter.length,
                              shrinkWrap: true,
                              itemBuilder: (BuildContext context, int index) {
                                return
//
                                  InkWell(
                                    onTap:(){ Get.to(MenuItems(category: controller.cuisineFilter[index]["cuisin"]));


                                      }  ,
    child: Container(
                                        margin: EdgeInsets.symmetric(
                                            vertical: 20),
                                        width: MediaQuery
                                            .of(context)
                                            .size
                                            .width,
                                        height: 220,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            colorFilter: new ColorFilter.mode(
                                                Colors.black.withOpacity(0.8),
                                                BlendMode.dstATop),
                                            fit: BoxFit.fill,
                                            image: NetworkImage(controller
                                                .cuisineFilter[index]['image']),
                                          ),
                                        ),
                                        alignment: Alignment.bottomCenter,
                                        // This aligns the child of the container
                                        child: Padding(
                                            padding: EdgeInsets.only(
                                                bottom: 10.0),
                                            //some spacing to the child from bottom
                                            child: Container(
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius: BorderRadius
                                                      .circular(8),
                                                ),

                                                padding: EdgeInsets.all(5),

                                                child: Text(controller
                                                    .cuisineFilter[index]['name']
                                                    .toString(), style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold)))
                                        )
                                    ),
                                  );
                              }),
                        ) : Center(child: Text("No Item Found",style: TextStylesCustom.textStyles_26,)),
                        //   ],),
                        // ),
                        // Text(controller.cuisineFilter .toString())


                      ],
                    ),));
            }

            );
        },
      );
  }

}
