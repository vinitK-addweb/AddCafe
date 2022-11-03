import 'package:flutter/material.dart';
import '../views/HomeBanner.dart';
import '../views/HomeCategory.dart';
import '../Drawer/drawerHeader.dart';
import '../Drawer/drawerList.dart';
import '../BottomNavBar.dart';
import 'MyLoader.dart';
import 'MySearch.dart';
import 'CustomerReviews.dart';
import 'NewsLetter.dart';
import 'package:get/get.dart';
import '../GetxController/MyHomePage_controller.dart';

class MyHomePage extends StatelessWidget {
  final HomeBannerController controller = Get.put(HomeBannerController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: HomeBannerController(),
      initState: (state) {
        controller.initMethodGetX();
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
                      true
                          ? Container(
                              width: MediaQuery.of(context).size.width,
                              margin: EdgeInsets.symmetric(horizontal: 30),
                              child: ElevatedButton(
                                  onPressed: () => {}, child: Text('Log Out')))
                          : SizedBox(
                              height: 0,
                              child: Text(''
                                  // userAuth.userprofile.isNotEmpty ? 'true' : 'false'
                                  ),
                            )
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
                child: !(controller.homeBannerData.value.isNotEmpty ||
                        controller.homeCategoryData.value.isNotEmpty)
                    ? MyLoader()
                    : Container(
                        child: Column(
                          children: <Widget>[
                            Mysearch(),
                            HomeBanner(controller.homeBannerData.value),
                            HomeCategory(controller.homeCategoryData.value),
                            // CategoryItems(),
                            CustomerReviews(
                                controller.customerReviewsData.value),
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
