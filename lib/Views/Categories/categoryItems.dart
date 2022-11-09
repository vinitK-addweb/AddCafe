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

class CategoryItems extends StatefulWidget {
  // CategoryItems({Key? key}) : super(key: key);
  CategoryItems(this.currentCategory);

  final String currentCategory;

  @override
  State<CategoryItems> createState() => _CategoryItemsState(currentCategory);
}

class _CategoryItemsState extends State<CategoryItems> {
  _CategoryItemsState(this.currentCategory);
  // final controller = HomeBannerController();
  String currentCategory;
  changeCategory(String category) {
    if (currentCategory == category) {
      setState(() {
        currentCategory = '';
      });
    } else {
      setState(() {
        currentCategory = category;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // final categoriesData = Provider.of<CategoriesApi>(context);
    final HomeBannerController controller = Get.put(HomeBannerController());
    final activeProductsController = Get.put(CategoriesApi());
    // final homeCategoryApi = Provider.of<HomeCategoryApi>(context);
    // final homeBannerApi = Provider.of<HomeBannerApi>(context);
    // final cartApi = Provider.of<CartApi>(context);
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
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          HomeBanner(controller.bannerData.value),
          ...(controller.categoriesData.value).map((e) {
            activeProductsController.getFilteredProducts(e.name);
            // print(categoriesData.allProducts);
            return Card(
                child: Column(
              children: [
                InkWell(
                    onTap: () {
                      changeCategory('${e.name}');
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${e.name}(${activeProductsController.categoryProduct.length})',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        IconButton(
                            onPressed: () {
                              changeCategory('${e.name}');
                            },
                            icon: Icon(currentCategory == e.name
                                ? Icons.arrow_drop_up
                                : Icons.arrow_drop_down))
                      ],
                    )),
                currentCategory == e.name &&
                        activeProductsController
                            .categoryProduct.value.isNotEmpty
                    ? CategoryDropdown(
                        activeProductsController.categoryProduct.value)
                    : SizedBox(
                        height: 0,
                      ),
              ],
            ));
          }).toList()
        ]),
      ),
    );
  }
}
