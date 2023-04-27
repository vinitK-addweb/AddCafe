import 'dart:core';
import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Components/AppBarStyle.dart';
import '../GetxController/Cart_controller.dart';
import '../GetxController/MenuItems_controller.dart';
import '../GetxController/MyHomePage_controller.dart';
import '../GetxController/ViewMore_controller.dart';
import '../GetxController/searchResult_controller.dart';
import '../Styles/ColorStyle.dart';
import '../Styles/TextStyles.dart';
import 'Cart/cart.dart';
import 'SearchResult.dart';

class MenuItems extends StatelessWidget {
  MenuItems({Key? key,required this.category }) : super(key: key);

  final category;
  final cart = Get.find<CartController >();
  final controller = Get.put(MenuItemsController());
  @override
  Widget build(BuildContext context) {
    return
      GetBuilder(
        init: MenuItemsController(),
        initState: controller.initFunction(),
        builder: (_) {
          return
            Obx(() {
              return
                Scaffold(
                    appBar: AppBarStyle(

                      backgroundColor: ColorStyle.primaryColorRed,
                      trailings: [
                        controller.search.value
                            ? IconButton(
                            onPressed: () {},
                            icon: IconButton(
                              iconSize: 30,
                              onPressed: () {
                                Get.find<SearchResultController>().itemName.value.text = '';

                                controller.search.value = false;
                                Get.find<SearchResultController>().searchResult.value = [];
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
                      title: 'Menu Items',
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


                    Column(
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
                                hintText:
                                "Search Your Favourite Food Here", //hint text
                                prefixIcon:
                                const Icon(Icons.search), //prefix iocn
                                hintStyle: TextStylesCustom.textStyles_16
                                    .apply(
                                    color: ColorStyle.secondryColorBlack
                                        .withOpacity(0.5)),
                              )),
                        ),
                        const SizedBox(height: 5,),
                        Wrap(
                          runSpacing:8.0,
                          direction: Axis.horizontal,
                          spacing: 10,

                          children: [


                            InkWell(
                              onTap: () {
                                if(                      controller.veg.value == 1){    controller.veg.value = 0;}else
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
                                        style: BorderStyle.solid
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Align(alignment: Alignment.center,
                                      child: Text(
                                        'Veg', textAlign: TextAlign.center,
                                        style: TextStylesCustom.textStyles_14
                                            .apply(fontWeightDelta: 3),))),
                            ),
                            InkWell(
                              onTap: () {
                                if(                      controller.veg.value == 2){    controller.veg.value = 0;}else
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
                                        style: BorderStyle.solid
                                    ),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Align(alignment: Alignment.center,
                                      child: Text(
                                        'Non Veg', textAlign: TextAlign.center,
                                        style: TextStylesCustom.textStyles_14
                                            .apply(fontWeightDelta: 3),))),
                            ),
                            InkWell(
                              onTap: () {
                                if(  controller.lowToHigh.value ==1){    controller.lowToHigh.value = 0;}else
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
                                        style: BorderStyle.solid
                                    ),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Align(alignment: Alignment.center,
                                      child: Text(
                                        'Low to High', textAlign: TextAlign.center,
                                        style: TextStylesCustom.textStyles_14
                                            .apply(fontWeightDelta: 3),))),
                            ),
                            InkWell(
                              onTap: () {
                                if(  controller.lowToHigh.value ==2){    controller.lowToHigh.value = 0;}else
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
                                        style: BorderStyle.solid
                                    ),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Align(alignment: Alignment.center,
                                      child: Text(
                                        'High to Low ', textAlign: TextAlign.center,
                                        style: TextStylesCustom.textStyles_14
                                            .apply(fontWeightDelta: 3),))),
                            ),

                          ],),

                        const SizedBox(height: 20,),


Expanded(child:
controller.search.value
    ?

SingleChildScrollView(child:

SearchResult()):Text("helooo"),

              )   // controller.cuisineFilter.isNotEmpty ?
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
                    ),);
            }

            );
        },
      );
  }

}
