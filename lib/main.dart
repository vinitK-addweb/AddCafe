import 'package:addcafe/Providers/apis/FaqApi.dart';
import 'package:addcafe/route_generator.dart';
import 'package:addcafe/widgets/myfavourits.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:addcafe/Providers/apis/HomeBannerApi.dart';
import 'package:addcafe/Providers/apis/HomeCategoryApi.dart';
import 'package:addcafe/Providers/apis/CustomerReviewsApi.dart';
import 'package:addcafe/Providers/apis/CategoriesApi.dart';
import 'package:addcafe/Providers/apis/UserAuth.dart';
import 'package:addcafe/Providers/apis/CartApi.dart';
import 'package:addcafe/Providers/apis/MyfavouritesApi.dart';
import 'package:addcafe/Providers/apis/addAddressApi.dart';
import 'package:addcafe/Providers/apis/UserOrderApi.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './widgets/HomeBanner.dart';
import './widgets/HomeCategory.dart';
import './widgets/CustomerReviews.dart';
import './widgets/NewsLetter.dart';
import 'Drower/drawerHeader.dart';
import 'Drower/drawerList.dart';
import 'widgets/searchBar.dart';
import 'footer.dart';
import 'widgets/Loader.dart';
import 'dart:convert';

Future<void> main() async {
  await dotenv.load();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => HomeBannerApi()),
    ChangeNotifierProvider(create: (_) => HomeCategoryApi()),
    ChangeNotifierProvider(create: (_) => CustomerReviewsApi()),
    ChangeNotifierProvider(create: (_) => CategoriesApi()),
    ChangeNotifierProvider(create: (_) => UserAuth()),
    ChangeNotifierProvider(create: (_) => CartApi()),
    ChangeNotifierProvider(create: (_) => MyFavouritesApi()),
    ChangeNotifierProvider(create: (_) => AddaddressApi()),
    ChangeNotifierProvider(create: (_) => FaqApi()),
    ChangeNotifierProvider(create: (_) => UserOrderApi()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final userAuth = Provider.of<UserAuth>(
      context,
    );
    userAuth.getlocaStorage();
    final Faqdata = Provider.of<FaqApi>(context, listen: false);
    Faqdata.fetchFaqData();

    final cartApi = Provider.of<CartApi>(context, listen: false);
    cartApi.fetchCart();

    final categoriesApiData =
        Provider.of<CategoriesApi>(context, listen: false);
    categoriesApiData.fetchAllProducts();

    final customerReviewsApi =
        Provider.of<CustomerReviewsApi>(context, listen: false);
    customerReviewsApi.fetchCustomerReviews();

    final homeBannerApi = Provider.of<HomeBannerApi>(context, listen: false);
    homeBannerApi.fetchHomeBanner();

    final homeCategoryApi =
        Provider.of<HomeCategoryApi>(context, listen: false);
    homeCategoryApi.fetchHomeCategory();

    final addaddressApi = Provider.of<AddaddressApi>(context, listen: false);
    addaddressApi.fetchSavedAddress();

    final userOrderApi = Provider.of<UserOrderApi>(context, listen: false);
    userOrderApi.fetchUserOrder();

    return MaterialApp(
      initialRoute: '/splash',
      onGenerateRoute: RouteGenerator.generateRoute,
      debugShowCheckedModeBanner: false,
      title: 'cafe',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
    );
  }
}

// late List customerReviews = [];

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isLoading = false;

  void initState() {
    super.initState();
    loadData();
  }

// <--------------------Loader Function Starts from here---------------------->
  Future loadData() async {
    setState(() => isLoading = true);
    await Future.delayed(Duration(seconds: 2), () {});
    setState(() => isLoading = false);
  }

  // <--------------------Loader Function ends from here---------------------->

  @override
  Widget build(BuildContext context) {
    final userAuth = Provider.of<UserAuth>(context);
    final homeBannerData = Provider.of<HomeBannerApi>(context, listen: false);
    final homeCategoryData =
        Provider.of<HomeCategoryApi>(context, listen: false);
    final customerReviewsData =
        Provider.of<CustomerReviewsApi>(context, listen: false);
    return Scaffold(
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
              userAuth.userprofile.isNotEmpty
                  ? Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 30),
                      child: ElevatedButton(
                          onPressed: () => userAuth.logOut(context),
                          child: Text('Log Out')))
                  : SizedBox(
                      height: 0,
                      child: Text(
                          userAuth.userprofile.isNotEmpty ? 'true' : 'false'),
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
        child: homeBannerData.homeBannerData.isEmpty ||
                homeCategoryData.homeCategoryData.isEmpty
            ? MyLoader()
            : Container(
                child: Column(
                  children: <Widget>[
                    Mysearch(),
                    HomeBanner(homeBannerData.homeBannerData),
                    HomeCategory(homeCategoryData.homeCategoryData),
                    // CategoryItems(),
                    CustomerReviews(customerReviewsData.customerReviewsData),
                    NewsLetter(),
                    // Cart()
                  ],
                ),
              ),
      ),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
