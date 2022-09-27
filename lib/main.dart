import 'package:addcafe/widgets/splash.dart';
import 'package:flutter/material.dart';
import './widgets/HomeBanner.dart';
import './widgets/HomeCategory.dart';
import './widgets/CustomerReviews.dart';
import './widgets/NewsLetter.dart';
import 'Drower/drawerHeader.dart';
import 'Drower/drawerList.dart';
import 'widgets/searchBar.dart';
import 'footer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'cafe',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home:
            //  MyHomePage(),
            Splash());
  }
}

class MyHomePage extends StatefulWidget {
  // const MyHomePage({super.key, required this.title});

  // final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: NetworkImage('https://cdn.domestika.org/c_fit,dpr_auto,f_auto,t_base_params,w_820/v1616749426/content-items/007/482/585/DOMINOS%2520BEHANCE-05-original.jpg?1616749426'), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
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
                Mysearch(),
                HomeBanner(),
                HomeCategory(),
                CustomerReviews(),
                NewsLetter(),
              ],
            ),
          ),
        ),

        // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
