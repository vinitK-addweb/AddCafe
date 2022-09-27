import 'package:flutter/material.dart';
import './widgets/HomeBanner.dart';
import './widgets/HomeCategory.dart';
import 'Drower/drawerHeader.dart';
import 'Drower/drawerList.dart';
import 'widgets/searchBar.dart';

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
      home: MyHomePage(),
    );
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
    return Scaffold(

      drawer: Drawer(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.blue,
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
      appBar: AppBar(
        elevation: 0,
        title: Image.asset(
          'assets/images/addweb.png', height: 100, width: 225,
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
      body: Container(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[Mysearch(), HomeBanner(),HomeCategory()],
        ),
      ),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
