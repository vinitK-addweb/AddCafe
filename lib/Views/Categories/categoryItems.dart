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
import '../../Styles/TextStyles.dart';
import '../../Styles/ColorStyle.dart';
import '../../Components/AppBarStyle.dart';

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
    final ActiveProductsController controller =
        Get.put(ActiveProductsController());

    return GetBuilder(
      init: controller,
      initState: (_) {
        // controller.selectedCategory = widget.selectedMenu;
        controller.initCustom();
        controller.getFilteredProducts(widget.selectedMenu);
        // controller.fetchAllProducts();
      },
      builder: (_) {
        return Obx(() => Scaffold(
            appBar: AppBarStyle(
              backgroundColor: ColorStyle.primaryColorRed,
              leading: IconButton(
                onPressed: () => Get.back(),
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              ),
              styleTitle: TextStylesCustom.textStyles_24,
              title: 'Categories',
            ),
            // AppBar(
            //   title: Text(
            //     'Categories',
            //     style: TextStylesCustom.textStyles_24,
            //   ),
            //   centerTitle: true,
            // ),
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
            body: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      controller.checkingObx.value,
                      style: TextStylesCustom.textStyles_10,
                    ),
                    HomeBanner(bannerData: widget.bannerData),
                    ListView.builder(
                      itemCount: widget.categoriesData.length,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        final e = widget.categoriesData[index];
                        // controller.getFilteredProducts(e.name);
                        return Card(
                            child: Column(
                          children: [
                            // Text(e.toString()),
                            InkWell(
                                onTap: () {
                                  controller.selectedCategory.value = e.name!;
                                  controller.getFilteredProducts('${e.name}');
                                  Future.delayed(Duration(milliseconds: 2), () {
                                    controller.update();
                                    // categoryProductFilter();
                                  });
                                },
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '${e.name}',
                                      // '(${controller.categoryProduct.length})',
                                      style: TextStylesCustom.textStyles_20
                                          .apply(fontWeightDelta: 3),
                                    ),
                                    IconButton(
                                        onPressed: () {
                                          // print("object");
                                          // print(e.name);
                                          // controller
                                          //     .changeCategory('${e.name}');
                                          controller
                                              .getFilteredProducts(e.name);
                                          controller.update();
                                        },
                                        icon: Icon(
                                            controller.selectedCategory ==
                                                    e.name
                                                ? Icons.arrow_drop_up
                                                : Icons.arrow_drop_down))
                                  ],
                                )),
                            controller.selectedCategory == e.name
                                ? CategoryDropdown(controller.categoryProduct)
                                : const SizedBox(
                                    height: 0,
                                  )
                          ],
                        ));
                      },
                    ),
                  ]),
            )));
      },
    );
  }
}
