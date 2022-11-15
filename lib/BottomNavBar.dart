import 'package:addcafe/Views/MyHomePage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'GetxController/MyHomePage_controller.dart';
import '../Views/Offers.dart';

class TheFooter extends StatelessWidget {
  final controller = Get.put(HomeBannerController());

  double iconSize = 24;

  final arrBody = [
    MyHomePage(),
    const Offers(),
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: HomeBannerController(),
        builder: (_) {
          return Obx(() => Scaffold(
                backgroundColor: Colors.white,
                body: arrBody[controller.currentIndex.value],
                bottomNavigationBar: BottomNavigationBar(
                  currentIndex: controller.currentIndex.value,
                  type: BottomNavigationBarType.fixed,
                  iconSize: 35,
                  items: [
                    BottomNavigationBarItem(
                        icon: Icon(Icons.menu_open_outlined),
                        label: 'Menu',
                        backgroundColor: Colors.blue),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.wallet_giftcard_outlined),
                        label: 'Rewards',
                        backgroundColor: Colors.blue),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.shopping_bag_outlined),
                        label: 'Offers',
                        backgroundColor: Colors.blue),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.shopping_cart),
                        label: 'Cart',
                        backgroundColor: Colors.blue),

                    // BottomNavigationBarItem(icon: Icon(Icons.point_of_sale), label: 'Cart')
                  ],
                  onTap: (index) {
                    // controller.setCurrentIndex(index);
                    controller.currentIndex.value = index;
                    // if (index == 0) Get.to(MyHomePage());
                    // if (index == 2) Get.to(Offers());
                  },
                ),
              ));
        });
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
