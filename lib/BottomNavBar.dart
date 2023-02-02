import 'Views/Wishlist.dart';
import 'package:get/get.dart';
import '../Views/Offers.dart';
import '../Views/Cart/cart.dart';
import 'Views/OrderHistory.dart';
import './Styles/TextStyles.dart';
import 'package:flutter/material.dart';
import 'GetxController/Cart_controller.dart';
import 'package:addcafe/Views/MyHomePage.dart';
import 'package:addcafe/Styles/ColorStyle.dart';
import 'package:addcafe/Views/userProfile.dart';
import 'GetxController/MyHomePage_controller.dart';

class BottamNavigationBar extends StatelessWidget {
  final controller = Get.put(HomeBannerController());

  double iconSize = 24;

  final arrBody = [MyHomePage(), OrderHistory(), UserProfile(), Myfavourits()];
  final cart = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: GetBuilder(
          init: HomeBannerController(),
          initState: cart.initMethod(),
          builder: (_) {
            return Obx(() => WillPopScope(
                  onWillPop: () async {
                    return false;
                  },
                  child: Scaffold(
                    backgroundColor: Colors.white,
                    body: arrBody[controller.currentIndex.value],
                    bottomNavigationBar: BottomNavigationBar(
                      currentIndex: controller.currentIndex.value,
                      type: BottomNavigationBarType.fixed,
                      iconSize: 28,
                      unselectedIconTheme: IconThemeData(
                          color: ColorStyle.secondaryColorgrey,
                          opacity: 0.8,
                          size: 25),
                      selectedIconTheme: IconThemeData(
                          color: ColorStyle.primaryColorRed,
                          opacity: 2.0,
                          size: 28),
                      selectedLabelStyle: TextStylesCustom.textStyles_20,
                      unselectedLabelStyle: TextStylesCustom.textStyles_16,
                      items: const [
                        BottomNavigationBarItem(
                          icon: Icon(Icons.home),
                          label: 'Home',
                        ),
                        BottomNavigationBarItem(
                          icon: Icon(Icons.history),
                          label: 'History',
                        ),
                        BottomNavigationBarItem(
                          icon: Icon(Icons.person_outline),
                          label: 'Profile',
                        ),
                        BottomNavigationBarItem(
                          icon: Icon(Icons.shopping_cart),
                          label: 'Wishlist',
                        ),
                      ],
                      onTap: (index) {
                        controller.currentIndex.value = index;
                      },
                    ),
                  ),
                ));
          }),
    );
  }
}
