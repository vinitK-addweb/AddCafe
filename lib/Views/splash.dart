import 'dart:convert';
import '../main.dart';
import 'dart:developer';
import 'MyHomePage.dart';
import 'Auth/Signin.dart';
import 'package:get/get.dart';
import '../BottomNavBar.dart';
import 'package:flutter/material.dart';
import 'package:addcafe/Utils/Global.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// import 'package:addcafe/Providers/apis/UserAuth.dart';
// import 'package:provider/provider.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  void initState() {
    super.initState();
    FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
    Future.delayed(Duration(milliseconds: 10), () {
      _firebaseMessaging.getToken().then((token) {
        print('FlutterFire Messaging Example: Got APNs token: $token');
      });
    });

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification notification = message.notification!;
      AndroidNotification android = message.notification!.android!;
      if (notification != null && android != null) {
        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(channel.id, channel.name,
                  color: Colors.blue,
                  playSound: true,
                  icon: '@mipmap/ic_launcher'),
            ));
      }
    });
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print("A new  onMessageOpenedApp event was published!");
      RemoteNotification notification = message.notification!;
      AndroidNotification android = message.notification!.android!;
      if (notification != null && android != null) {
        showDialog(
            context: context,
            builder: (_) {
              return AlertDialog(
                title: Text(notification.title!),
                content: SingleChildScrollView(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Text(notification.body!)],
                )),
              );
            });
      }
    });
    getlocaStorage();
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

          Get.to(() => BottamNavigationBar());
        } catch (error) {
          log(error.toString());
        }
      } else {
        userprofile = {};

        Get.to(() => Mylogin());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
              margin: const EdgeInsets.fromLTRB(40, 200, 40, 100),
              child: Image.asset(
                'assets/images/addweb.gif',
              )),
          Image.asset(
            'assets/images/delivery.gif',
          ),
        ],
      ),
    );
  }
}
