import 'package:flutter/material.dart';
import '../views/HomeBanner.dart';
import '../Drawer/drawerHeader.dart';
import '../Drawer/drawerList.dart';
import '../BottomNavBar.dart';
import 'package:get/get.dart';
import '../GetxController/MyHomePage_controller.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class MyHomePage extends StatefulWidget {
  // const MyHomePage({super.key, required this.title});

  // final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isLoading = false;

  // Future getHomeCategory() async {
  //   http.Response response;
  //   response = await http
  //       .get(Uri.parse('https://vinit-api-data.herokuapp.com/category'));
  //   if (response.statusCode == 200) {
  //     setState(() {
  //       homeCategoryData = json.decode(response.body);
  //     });
  //     print('runnnnn');
  //   } else {
  //     print('not running');
  //   }
  // }

  // Future getHomeBanner() async {
  //   http.Response response;
  //   response = await http
  //       .get(Uri.parse('https://kindly-opposite-wishbone.glitch.me/products'));
  //   if (response.statusCode == 200) {
  //     setState(() {
  //       homeBannerData = json.decode(response.body);
  //     });
  //     print('runnnnn');
  //   } else {
  //     print('not running');
  //   }
  // }

  void initState() {
    super.initState();
    loadData();
    // getHomeBanner();
    // getHomeCategory();
  }

  Future loadData() async {
    setState(() => isLoading = true);
    await Future.delayed(Duration(seconds: 2), () {});
    setState(() => isLoading = false);
  }

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
                // Padding(
                // padding: const EdgeInsets.all(8.0),
                // child:
              ),
              body: SingleChildScrollView(
                child: Container(
                  child: Column(
                    children: <Widget>[
                      // Mysearch(),
                      HomeBanner(controller.homeBannerData.value),
                      // HomeCategory(homeCategoryData),
                      // CustomerReviews(),
                      // NewsLetter(),
                      // Container(
                      //   child: Text(BannerData),
                      // )
                    ],
                  ),
                ),
              ),

              // This trailing comma makes auto-formatting nicer for build methods.
            )));
      },
    );

    ;
  }
}
