import 'package:addcafe/route_generator.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:addcafe/Providers/apis/HomeBannerApi.dart';
import 'package:addcafe/Providers/apis/HomeCategoryApi.dart';
import 'package:addcafe/Providers/apis/CustomerReviewsApi.dart';
import 'package:addcafe/Providers/apis/CategoriesApi.dart';
import './widgets/HomeBanner.dart';
import './widgets/HomeCategory.dart';
import './widgets/CustomerReviews.dart';
import './widgets/NewsLetter.dart';
import 'Drower/drawerHeader.dart';
import 'Drower/drawerList.dart';
import 'widgets/searchBar.dart';
import 'footer.dart';
import 'widgets/Loader.dart';

Future<void> main() async {
  await dotenv.load();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => HomeBannerApi()),
    ChangeNotifierProvider(create: (_) => HomeCategoryApi()),
    ChangeNotifierProvider(create: (_) => CustomerReviewsApi()),
    ChangeNotifierProvider(create: (_) => CategoriesApi()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
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

  Future loadData() async {
    setState(() => isLoading = true);
    await Future.delayed(Duration(seconds: 2), () {});
    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    final homeBannerData = Provider.of<HomeBannerApi>(context);
    final homeCategoryData = Provider.of<HomeCategoryApi>(context);
    final customerReviewsData = Provider.of<CustomerReviewsApi>(context);
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
