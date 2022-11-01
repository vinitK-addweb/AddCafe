import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:addcafe/views/splash.dart';
import 'package:flutter/material.dart';

import 'views/HomeCategory.dart';
import 'views/CustomerReviews.dart';
import 'views/NewsLetter.dart';

import 'views/searchBar.dart';
import 'BottomNavBar.dart';
import 'views/Loader.dart';
import 'dart:convert';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'cafe',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home:
            //  MyHomePage(),
            Splash());
  }
}

late List homeBannerData = [];
late List homeCategoryData = [];
