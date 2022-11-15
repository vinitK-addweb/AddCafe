import 'dart:ffi';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:addcafe/Views/splash.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './Components/IndicatorSlider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
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
        home: Splash());
  }
}
