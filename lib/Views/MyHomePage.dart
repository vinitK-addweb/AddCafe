import 'package:flutter/material.dart';
import '../GetxController/Cart_controller.dart';

import '../GetxController/UserProfile_controller.dart';
import '../GetxController/Wishlist_controller.dart';
import '../Styles/TextStyles.dart';
import 'Cart/cart.dart';
import 'HomeBanner.dart';
import 'HomeCategory.dart';
import '../Drawer/drawerHeader.dart';
import '../Drawer/drawerList.dart';

import 'MyLoader.dart';

import 'package:get/get.dart';
import '../GetxController/MyHomePage_controller.dart';
import '../GetxController/UserAuth_controller.dart';
import '../Styles/ColorStyle.dart';
import '../Components/logoCustom.dart';
import '../Views/SearchResult.dart';
import '../GetxController/searchResult_controller.dart';

class MyHomePage extends StatelessWidget {
  final HomeBannerController controller = Get.put(HomeBannerController());
  final search = Get.put(SearchResultController());
  final userAuth = Get.put(UserAuth());
  final cart = Get.put(CartController());
  final userProfile = Get.put(UserProfileController());
  final myFavouritesApi = Get.put(MyFavouritesApi());
  // final userProfile = Get.put(UserProfileController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: HomeBannerController(),
      initState: (state) {
        cart.initMethod();
        userAuth.initCustom();
        controller.initMethodGetX();
        myFavouritesApi.initMethod();
        userProfile.initprofile();
      },
      builder: (controller) {
        return Obx((() => Scaffold(
              drawer: Drawer(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: ColorStyle.primaryColorRed,
                        ),
                        child: Column(children: const [
                          DrowerHeader(),
                        ]),
                      ),
                      MyDrowerList(),
                      // userAuth.userprofile.isNotEmpty
                    ],
                  ),
                ),
              ),
              // bottomNavigationBar: TheFooter(),
              appBar: AppBar(
                elevation: 0,
                title: const LogoCustomWhite(),
                actions: [
                  controller.search.value
                      ? IconButton(
                          onPressed: () {},
                          icon: IconButton(
                            iconSize: 30,
                            onPressed: () {
                              controller.search.value = false;
                              search.searchResult.value = [];
                              search.itemName.value.text = '';
                            },
                            icon: const Icon(Icons.close),
                          )
                          // : const Icon(Icons.notifications),
                          )
                      : const SizedBox(
                          height: 0,
                          width: 50,
                        )
                ],
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

              body: SingleChildScrollView(
                child: !(controller.bannerData.isNotEmpty ||
                        controller.categoriesData.isNotEmpty)
                    ? const MyLoader()
                    : Column(
                        children: <Widget>[
                          const SizedBox(
                            height: 20,
                          ),

                          // <------------------- Search Bar --------------------------->

                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 20),
                            child: TextField(
                                onChanged: (value) {
                                  search.itemName.value.text = value;
                                  search.initfunction();
                                },
                                // controller: search.itemName.value,
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

                          const SizedBox(
                            height: 20,
                          ),

                          controller.search.value
                              ? SearchResult()
                              : Column(
                                  children: [
                                    HomeBanner(
                                        bannerData:
                                            controller.bannerData.value),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    HomeCategory(
                                        controller.categoriesData.value,
                                        controller.bannerData.value),
                                  ],
                                )
                        ],
                      ),
              ),

              // This trailing comma makes auto-formatting nicer for build methods.
            )));
      },
    );
  }
}
