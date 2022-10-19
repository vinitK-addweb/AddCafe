import 'package:flutter/material.dart';
import 'auth/signin.dart';
import '../main.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  void initState() {
    super.initState();
    _navigatetohome();
  }

  _navigatetohome() async {
    await Future.delayed(Duration(milliseconds: 5500), () {});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Mylogin()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
              margin: EdgeInsets.fromLTRB(40, 200, 40, 100),
              child: Image.asset(
                'assets/images/addweb.gif',
              )),
          Container(
            child: Image.asset(
              'assets/images/delivery.gif',
              // ),
              //
              // Text(
              //   'Splash Screen',
              //   style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              // ),
            ),
          ),
        ],
      ),
    );
  }
}
