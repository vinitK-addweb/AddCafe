import 'package:flutter/material.dart';
import '../Components/AppBarStyle.dart';
import '../Components/MainDrawer.dart';
import '../Styles/TextStyles.dart';
import 'HomeBanner.dart';
import 'HomeCategory.dart';
import '../Drawer/drawerHeader.dart';

// import '../BottomNavBar.dart';
import 'MyLoader.dart';
import 'MySearch.dart';
import 'CustomerReviews.dart';
// import 'NewsLetter.dart';
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
  final userAuth = UserAuth();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: HomeBannerController(),
      initState: (state) {
        userAuth.initCustom();
        controller.initMethodGetX();
      },
      builder: (controller) {
        return Obx((() => Scaffold(
              // drawer: MainDrawer(),
              key: scaffoldKey,
              drawer: const MainDrawer(),
              // appBar: AppBarStyle(
              //   styleTitle: TextStylesCustom.textStyles_24,
              //   elevation: 0,
              //   title: 'Offers',
              //   backgroundColor: ColorStyle.primaryColorRed,
              //   leading: IconButton(
              //     onPressed: () => scaffoldKey.currentState!.openDrawer(),
              //     // currentIndex.value = 0,
              //     icon: const Icon(
              //       Icons.menu,
              //       size: 34,
              //       color: Colors.white,
              //     ),
              //   ),
              // ),
              // // Drawer(
              //   child: SingleChildScrollView(
              //     child: Column(
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: [
              //         Container(
              //           decoration: BoxDecoration(
              //             color: ColorStyle.primaryColorRed,
              //           ),
              //           child: Column(children: const [
              //             DrowerHeader(),
              //           ]),
              //         ),
              //         MyDrowerList(),
              //         // userAuth.userprofile.isNotEmpty
              //       ],
              //     ),
              //   ),
              // ),
              // bottomNavigationBar: TheFooter(),
              appBar: AppBar(
                elevation: 0,
                title: const LogoCustomWhite(),
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: controller.search.value
                        ? IconButton(
                            onPressed: () {
                              controller.search.value = false;
                              search.searchResult.value = [];
                              search.itemName.value.text = '';
                            },
                            icon: const Icon(Icons.close),
                          )
                        : const Icon(Icons.notifications),
                  )
                ],
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
                                controller: search.itemName.value,
                                onChanged: (value) {
                                  search.itemName.value.text = value;
                                  search.initfunction();
                                },
                                onTap: (() {
                                  controller.search.value = true;
                                }),
                                decoration: InputDecoration(
                                  hintText:
                                      "Search Your Favourite Food Here", //hint text
                                  prefixIcon:
                                      const Icon(Icons.search), //prefix iocn
                                  hintStyle: TextStylesCustom.textStyles_20
                                      .apply(
                                          color: ColorStyle.secondryColorBlack
                                              .withOpacity(0.5)),
                                )),
                          ),
                          // ElevatedButton(
                          //     onPressed: () {
                          //       search.initfunction();
                          //     },
                          //     child: Text("Search")),
                          // Mysearch(),
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
