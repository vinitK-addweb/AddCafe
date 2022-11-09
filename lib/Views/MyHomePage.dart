import 'package:flutter/material.dart';
import 'HomeBanner.dart';
import 'HomeCategory.dart';
import '../Drawer/drawerHeader.dart';
import '../Drawer/drawerList.dart';
import '../BottomNavBar.dart';
import 'MyLoader.dart';
import 'MySearch.dart';
import 'CustomerReviews.dart';
import 'NewsLetter.dart';
import 'package:get/get.dart';
import '../GetxController/MyHomePage_controller.dart';
import '../GetxController/UserAuth_controller.dart';

class MyHomePage extends StatelessWidget {
  final HomeBannerController controller = Get.put(HomeBannerController());
  final userAuth = UserAuth();
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: HomeBannerController(),
      initState: (state) {
        controller.initMethodGetX();
        userAuth.getlocaStorage();
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
                          color: Colors.red,
                        ),
                        child: Column(children: [
                          DrowerHeader(),
                        ]),
                      ),
                      Container(
                        child: MyDrowerList(),
                      ),
                      // userAuth.userprofile.isNotEmpty
                    ],
                  ),
                ),
              ),
              bottomNavigationBar: theFooter(),
              appBar: AppBar(
                elevation: 0,
                title: Image.asset(
                  'assets/images/addweb.png', height: 100, width: 200,
                  // ),
                ),
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.notifications),
                  )
                ],
              ),
              body: SingleChildScrollView(
                child: !(controller.bannerData.value.isNotEmpty ||
                        controller.categoriesData.value.isNotEmpty)
                    ? MyLoader()
                    : Container(
                        child: Column(
                          children: <Widget>[
                            Mysearch(),
                            // HomeBanner(controller.homeBannerData.value),
                            HomeBanner(controller.bannerData.value),
                            HomeCategory(controller.categoriesData.value),
                            // CategoryItems(),
                            // CustomerReviews(
                            //     controller.customerReviewsData.value),
                            NewsLetter(),
                          ],
                        ),
                      ),
              ),

              // This trailing comma makes auto-formatting nicer for build methods.
            )));
      },
    );
  }
}
