import 'package:addcafe/Views/Cart/cart.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../GetxController/Cart_controller.dart';
import '../../Utils/Global.dart';
import 'categoryDropdown.dart';
// import 'package:provider/provider.dart';
import '../HomeBanner.dart';

import '../../GetxController/ActiveProducts_controller.dart';

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
  final ActiveProductsController controller =
      Get.put(ActiveProductsController());
  final cartApi = Get.put(CartController());
  // void initState() {
  //   super.initState();
  //   controller.selectedCategory.value = widget.selectedMenu;
  //   // _navigatetohome();
  // }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: controller,
      initState: (_) {
        controller.selectedCategory.value = widget.selectedMenu;

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
                icon: const Icon(
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
            bottomNavigationBar: cartApi.cartData.length > 0
                ? InkWell(
                    onTap: (() => Get.to(navigateMultiBottom(context, Cart()))),
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${cartApi.cart['count']} ${cartApi.cartData.length > 1 ? 'ITEMS' : 'ITEM'}',
                                  style: TextStylesCustom.textStyles_16
                                      .apply(color: ColorStyle.white),
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  '₹ ${cartApi.cart['total_rate']}',
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
                                  style: TextStylesCustom.textStyles_22
                                      .apply(color: ColorStyle.white),
                                )
                              ],
                            )
                          ]),
                    ),
                  )
                : const SizedBox(
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
                                  Future.delayed(Duration(milliseconds: 0), () {
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
                                ?

                                //  Future.delayed(Duration(milliseconds: 2), () {});
                                CategoryDropdown(controller.categoryProduct)
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
