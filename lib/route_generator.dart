import 'package:flutter/material.dart';
import 'package:addcafe/main.dart';
import './widgets/cart/cart.dart';
import './widgets/splash.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings){

    final args = settings.arguments;

    switch(settings.name){
      case '/': 
        return MaterialPageRoute(builder: (_) => MyHomePage());

      case '/splash': 
        return MaterialPageRoute(builder: (_) => Splash());

      case '/second': 
        return MaterialPageRoute(builder: (_) => Cart());
      
      default: 
        return MaterialPageRoute(builder: (_) => MyHomePage());
    }
  }
}