import 'package:flutter/material.dart';
import 'package:addcafe/main.dart';
import './widgets/cart/cart.dart';
import './widgets/splash.dart';
import './widgets/category/CategoryItems.dart';
import './widgets/signin/signup.dart';
import './widgets/signin/signin.dart';
import './widgets/signin/otp.dart';
import './widgets/signin/password.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => MyHomePage());

      case '/splash':
        return MaterialPageRoute(builder: (_) => Splash());

      case '/signup':
        return MaterialPageRoute(builder: (_) => Signup());

      case '/signin':
        return MaterialPageRoute(builder: (_) => Mylogin());

      case '/cart':
        return MaterialPageRoute(builder: (_) => Cart());

      case '/category':
        return MaterialPageRoute(builder: (_) => CategoryItems(args as String));

      case '/Otp':
        return MaterialPageRoute(builder: (_) => Otp(args as String));
      case '/Password':
        return MaterialPageRoute(builder: (_) => Password(args as String));

      default:
        return MaterialPageRoute(builder: (_) => MyHomePage());
    }
  }
}
