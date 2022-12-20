import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../Styles/ImageStyle.dart';
import 'GetxController/MyHomePage_controller.dart';
import 'Styles/ColorStyle.dart';
import 'Styles/TextStyles.dart';
import 'Utils/Global.dart';
import 'Views/Cart/cart.dart';
import 'Views/MyHomePage.dart';
import 'Views/Offers.dart';

class BottomNavBarCustom extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => BottomNavBarCustomState();
}

class BottomNavBarCustomState extends State<BottomNavBarCustom> {
  // final controller = Get.put(HomeBannerController());
  String _currentPage = "Page1";
  List<String> pageKeys = ["Page1", "Page2", "Page3"];

  final Map<String, GlobalKey<NavigatorState>> _navigatorKeys = {
    "Page1": GlobalKey<NavigatorState>(),
    "Page2": GlobalKey<NavigatorState>(),
    "Page3": GlobalKey<NavigatorState>(),
  };

  int selectedIndex = 0;
  double iconSize = 24;

  void _selectTab(String tabItem, int index) {
    Future.delayed(Duration(milliseconds: 1), () {
      if (tabItem == _currentPage) {
        _navigatorKeys[tabItem]!
            .currentState!
            .popUntil((route) => route.isFirst);
      } else {
        setState(() {
          _currentPage = pageKeys[index];
          selectedIndex = index;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final isFirstRouteInCurrentTab =
            !await _navigatorKeys[_currentPage]!.currentState!.maybePop();
        if (isFirstRouteInCurrentTab) {
          if (_currentPage != "Page1") {
            _selectTab("Page1", 1);

            return false;
          }
        }
        // let system handle back button if we're on the first route
        return isFirstRouteInCurrentTab;
      },
      child: Scaffold(
          body: Stack(children: <Widget>[
            _buildOffstageNavigator("Page1"),
            _buildOffstageNavigator("Page2"),
            _buildOffstageNavigator("Page3"),
          ]),
          bottomNavigationBar: Container(
            height: 55,
            padding: const EdgeInsets.only(top: 5),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 3,
                  blurRadius: 3,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: IconButton(
                    onPressed: () {
                      _selectTab(pageKeys[0], 0);
                    },
                    icon: Icon(
                      Icons.home,
                      size: pageKeys[0] == _currentPage ? 30 : 25,
                      color: pageKeys[0] == _currentPage
                          ? ColorStyle.primaryColorRed
                          : Colors.grey,
                    ),
                  ),
                ),
                Expanded(
                    child: IconButton(
                  onPressed: () {
                    _selectTab(pageKeys[1], 1);
                  },
                  icon: Icon(
                    Icons.wallet_giftcard_outlined,
                    size: pageKeys[1] == _currentPage ? 30 : 25,
                    color: pageKeys[1] == _currentPage
                        ? ColorStyle.primaryColorRed
                        : Colors.grey,
                  ),
                )),
                // Expanded(
                //     child: IconButton(
                //   onPressed: () {
                //     // _selectTab(pageKeys[2], 2);
                //   },
                //   icon: Icon(
                //     Icons.shopping_bag_outlined,
                //     color: Colors.grey,
                //   ),
                // )),
                Expanded(
                    child: IconButton(
                  onPressed: () {
                    _selectTab(pageKeys[2], 2);
                  },
                  icon: Icon(
                    Icons.shopping_cart,
                    size: pageKeys[2] == _currentPage ? 30 : 25,
                    color: pageKeys[2] == _currentPage
                        ? ColorStyle.primaryColorRed
                        : Colors.grey,
                  ),
                )),
              ],
            ),
          )),
    );
  }

  Widget _buildOffstageNavigator(String tabItem) {
    return Offstage(
      offstage: _currentPage != tabItem,
      child: TabNavigator(
        navigatorKey: _navigatorKeys[tabItem],
        tabItem: tabItem,
      ),
    );
  }
}

class TabNavigatorRoutes {
  static const String root = '/';
  static const String detail = '/detail';
}

class TabNavigator extends StatelessWidget {
  TabNavigator({this.navigatorKey, this.tabItem});
  final GlobalKey<NavigatorState>? navigatorKey;
  final String? tabItem;

  @override
  Widget build(BuildContext context) {
    Widget? child;
    if (tabItem == "Page1") {
      child = MyHomePage();
    } else if (tabItem == "Page2") {
      child = const Offers();
    } else if (tabItem == "Page3") {
      child = Cart();
    }

    return Navigator(
      key: navigatorKey,
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(builder: (context) => child!);
      },
    );
  }
}
