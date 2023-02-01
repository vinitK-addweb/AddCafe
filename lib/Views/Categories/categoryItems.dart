import '../HomeBanner.dart';
import 'package:get/get.dart';
import 'categoryDropdown.dart';
import '../../Utils/Global.dart';
import '../../Styles/TextStyles.dart';
import '../../Styles/ColorStyle.dart';
import 'package:flutter/material.dart';
import '../../Models/Model_Banner.dart';
import '../../Components/AppBarStyle.dart';
import '../../Models/Model_Categories.dart';
import 'package:addcafe/Views/Cart/cart.dart';
import '../../GetxController/Cart_controller.dart';
import '../../GetxController/Wishlist_controller.dart';
import '../../GetxController/MyHomePage_controller.dart';
import '../../GetxController/ActiveProducts_controller.dart';
// ignore_for_file: unrelated_type_equality_checks

// import 'package:provider/provider.dart';

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
  final home = Get.put(HomeBannerController());
  // void initState() {
  //   super.initState();
  //   controller.selectedCategory.value = widget.selectedMenu;
  //   // _navigatetohome();
  // }
  // final myFavouritesApi = Get.put(MyFavouritesApi());
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: controller,
      initState: (_) {
        controller.selectedCategory.value = widget.selectedMenu;

        controller.initCustom();
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
              styleTitle: TextStylesCustom.textStyles_20,
              title: 'Categories',
            ),
            // AppBar(
            //   title: Text(
            //     'Categories',
            //     style: TextStylesCustom.textStyles_24,
            //   ),
            //   centerTitle: true,
            // ),

            bottomNavigationBar: cartApi.cartData.isNotEmpty
                ? Obx(() {
                    return Padding(
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
                    );
                  })
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
                      itemCount: home.categoriesData.length,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        final e = home.categoriesData[index];

                        return Card(
                            child: Column(
                          children: [
                            InkWell(
                                onTap: () {
                                  if (controller.selectedCategory.value ==
                                      e.name!) {
                                    controller.selectedCategory.value = '';

                                    Future.delayed(
                                        const Duration(milliseconds: 10), () {
                                      controller.update();
                                    });
                                  } else {
                                    controller.slectCategory(e.name!);

                                    Future.delayed(
                                        const Duration(milliseconds: 10), () {
                                      controller.update();
                                    });
                                  }
                                },
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '${e.name}',
                                        // '(${controller.categoryProduct.length})',
                                        style: TextStylesCustom.textStyles_16
                                            .apply(fontWeightDelta: 3),
                                      ),
                                      IconButton(
                                          onPressed: () {
                                            if (controller.selectedCategory ==
                                                e.name) {
                                              controller
                                                  .selectedCategory.value = '';
                                              Future.delayed(
                                                  const Duration(
                                                      milliseconds: 10), () {
                                                controller.update();
                                              });
                                            } else {
                                              controller
                                                  .getFilteredProducts(e.name);
                                              controller.slectCategory(e.name!);
                                              controller.update();
                                            }
                                          },
                                          icon: Icon(
                                              controller.selectedCategory ==
                                                      e.name
                                                  ? Icons.arrow_drop_up
                                                  : Icons.arrow_drop_down))
                                    ],
                                  ),
                                )),
                            controller.selectedCategory.value == e.name
                                ?

                                //  Future.delayed(Duration(milliseconds: 2), () {});
                                CategoryDropdown(
                                    // controller.categoryProduct
                                    )
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
