import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'MyHomePage.dart';
import 'Auth/Signin.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:addcafe/Providers/apis/UserAuth.dart';
import 'dart:convert';
import '../BottomNavBar.dart';
// import 'package:provider/provider.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  void initState() {
    super.initState();
    getlocaStorage();
    // _navigatetohome();
  }

  Map<String, dynamic> userprofile = {};

  getlocaStorage() async {
    Future.delayed(Duration(milliseconds: 5500), () async {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      var userDataPref = prefs.getString('userData');

      if (userDataPref != null) {
        try {
          userprofile =
              await Map<String, dynamic>.from(jsonDecode(userDataPref));

          Get.to(() => BottamNavigationBar()
              // MyHomePage()

              );
          // });
        } catch (error) {
          print(error);
        }
      } else {
        userprofile = {};

        Get.to(() => Mylogin());
      }
    });
  }

  // _navigatetohome() async {
  //   await Future.delayed(Duration(milliseconds: 5500), () {
  //     Navigator.pushReplacement(
  //         context, MaterialPageRoute(builder: (context) => Mylogin()));
  //   });
  // Navigator.pushReplacement(
  //     context, MaterialPageRoute(builder: (context) => Mylogin()));
  // }

  @override
  Widget build(BuildContext context) {
    // final userAuth = Provider.of<UserAuth>(context);

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
