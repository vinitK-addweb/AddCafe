import 'package:addcafe/Styles/ColorStyle.dart';
import 'package:addcafe/Views/MyHomePage.dart';
import 'package:addcafe/Views/userProfile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'GetxController/MyHomePage_controller.dart';
import './Styles/TextStyles.dart';
import '../Views/Offers.dart';
import '../Views/Cart/cart.dart';
import 'Views/Wishlist.dart';

class BottamNavigationBar extends StatelessWidget {
  final controller = Get.put(HomeBannerController());

  double iconSize = 24;

  final arrBody = [
    MyHomePage(),
    // Offers(),
    UserProfile(), Myfavourits()
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
        // final isFirstRouteInCurrentTab =
        //     !await _navigatorKeys[_currentPage]!.currentState!.maybePop();
        // if (isFirstRouteInCurrentTab) {
        //   if (_currentPage != "Page1") {
        //     _selectTab("Page1", 1);

        //     return false;
        //   }
        // }
        // // let system handle back button if we're on the first route
        // return isFirstRouteInCurrentTab;
      },
      child: GetBuilder(
          init: HomeBannerController(),
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
                        // BottomNavigationBarItem(
                        //   icon: Icon(Icons.wallet_giftcard_outlined),
                        //   label: 'Offers',
                        // ),
                        BottomNavigationBarItem(
                          icon: Icon(Icons.person_outline),
                          label: 'Profile',
                        ),
                        BottomNavigationBarItem(
                          icon: Icon(Icons.shopping_cart),
                          label: 'Wishlist',
                        ),

                        // BottomNavigationBarItem(icon: Icon(Icons.point_of_sale), label: 'Cart')
                      ],
                      onTap: (index) {
                        // controller.setCurrentIndex(index);
                        controller.currentIndex.value = index;
                        // if (index == 0) Get.to(MyHomePage());
                        // if (index == 2) Get.to(Offers());
                      },
                    ),
                  ),
                ));
          }),
    );
  }
}

// class theFooter extends StatefulWidget {
//   @override
//   State<theFooter> createState() => _theFooterState();
// }

// class _theFooterState extends State<theFooter> {
//   // int _currentIndex = 0;
//   @override
//   Widget build(BuildContext context) => BottomNavigationBar(
//         // currentIndex: _currentIndex,
//         type: BottomNavigationBarType.fixed,
//         iconSize: 35,
//         items: [
//           BottomNavigationBarItem(
//               icon: Icon(Icons.menu_open_outlined),
//               label: 'Menu',
//               backgroundColor: Colors.blue),
//           BottomNavigationBarItem(
//               icon: Icon(Icons.wallet_giftcard_outlined),
//               label: 'Rewards',
//               backgroundColor: Colors.blue),
//           BottomNavigationBarItem(
//               icon: Icon(Icons.shopping_bag_outlined),
//               label: 'Offers',
//               backgroundColor: Colors.blue),
//           BottomNavigationBarItem(
//               icon: Icon(Icons.shopping_cart),
//               label: 'Cart',
//               backgroundColor: Colors.blue),

//           // BottomNavigationBarItem(icon: Icon(Icons.point_of_sale), label: 'Cart')
//         ],
//         onTap: (index) {
//           setState(() {
//             controller.
//             _currentIndex = index;
//             if (index == 0) Get.to(MyHomePage());
//             if (index == 2) Get.to(Offers());
//             // if (index == 3) Navigator.of(context).pushNamed('/cart');
//           });
//         },
//       );
// }
