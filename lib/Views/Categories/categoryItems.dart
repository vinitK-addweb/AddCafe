// ignore_for_file: prefer_const_constructors

// import 'package:addcafe/Providers/apis/CategoriesApi.dart';
// import 'package:addcafe/Providers/apis/HomeBannerApi.dart';
// import 'package:addcafe/Providers/apis/HomeCategoryApi.dart';
// import 'package:addcafe/Providers/apis/CartApi.dart';

import 'package:addcafe/Models/Model_ActiveProducts.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'categoryDropdown.dart';
// import 'package:provider/provider.dart';
import '../HomeBanner.dart';
import '../../GetxController/MyHomePage_controller.dart';
import '../../GetxController/ActiveProducts_controller.dart';
import 'dart:convert';
import 'package:get/get.dart';
import '../../Models/Model_Banner.dart';
import '../../Models/Model_Categories.dart';


class CategoryItems extends StatefulWidget {
  // CategoryItems({Key? key}) : super(key: key);
  CategoryItems(this.selectedMenu, this.bannerData, this.categoriesData);

  final String selectedMenu;
  final List<ModelBanner> bannerData;
  final List<ModelCategories> categoriesData;

  @override
  State<CategoryItems> createState() => _CategoryItemsState();
}

class _CategoryItemsState extends State<CategoryItems> {

  @override
  Widget build(BuildContext context) {

    final ActiveProductsController controller = Get.put(ActiveProductsController());

    return Scaffold(
      appBar: AppBar(
        title: Text('Categories'),
        centerTitle: true,
      ),
      bottomNavigationBar:
      // cartApi.cart['count'] > 0
      //     ? Container(
      //         height: 50,
      //         child: ElevatedButton(
      //           onPressed: () {
      //             Navigator.of(context).pushNamed('/cart');
      //           },
      //           child: Row(
      //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //               children: [
      //                 Column(
      //                   mainAxisAlignment: MainAxisAlignment.center,
      //                   crossAxisAlignment: CrossAxisAlignment.start,
      //                   children: [
      //                     Text('${cartApi.cart['count']} ITEM'),
      //                     Text('Rs. ${cartApi.cart['total_rate']}')
      //                   ],
      //                 ),
      //                 Column(
      //                   mainAxisAlignment: MainAxisAlignment.center,
      //                   children: [
      //                     Text(
      //                       'Next  >',
      //                       style: TextStyle(fontSize: 20),
      //                     )
      //                   ],
      //                 )
      //               ]),
      //         ),
      //       )
      //     :
      SizedBox(
        height: 0,
      ),
      body: GetBuilder(
        init: ActiveProductsController(),
        initState: (_) {
          controller.selectedCategory = widget.selectedMenu;
          controller.fetchAllProducts();
        },
        builder: (_) {
          return Obx(() => SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    controller.checkingObx.value
                  ),
                  HomeBanner(widget.bannerData),

                  ListView.builder(
                    itemCount: widget.categoriesData.length,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final e = widget.categoriesData[index];

                      return Card(
                          child: Column(
                            children: [
                              InkWell(
                                  onTap: () {
                                    controller
                                        .changeCategory('${e.name}');
                                  },
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '${e.name}(${controller.categoryProduct.length})',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      IconButton(
                                          onPressed: () {
                                            controller
                                                .changeCategory('${e.name}');
                                          },
                                          icon: Icon(widget.selectedMenu == e.name
                                              ? Icons.arrow_drop_up
                                              : Icons.arrow_drop_down))
                                    ],
                                  )),
                              widget.selectedMenu == e.name &&
                                  controller
                                      .categoryProduct.isNotEmpty
                                  ? CategoryDropdown(
                                  controller.categoryProduct)
                                  : SizedBox(
                                height: 0,
                              ),
                            ],
                          ));
                    },
                  ),
                ]),
          ));
        },
      ),
    );
  }
}
