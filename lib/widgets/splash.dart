import 'package:flutter/material.dart';
import 'auth/signin.dart';
import '../main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:addcafe/Providers/apis/UserAuth.dart';
import 'dart:convert';
import 'package:provider/provider.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  void initState() {
    super.initState();
    _navigatetohome();
    getlocaStorage();
  }

  _navigatetohome() async {
    await Future.delayed(Duration(milliseconds: 5500), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Mylogin()));
    });
    // Navigator.pushReplacement(
    //     context, MaterialPageRoute(builder: (context) => Mylogin()));
  }

  getlocaStorage() async {
    Future.delayed(Duration(milliseconds: 5500), () async {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      var userDataPref = prefs.getString('userData');

      if (userDataPref != null) {
        // Map<String, dynamic> user = {
        //   "id": 1,
        //   "email": "addweb@addweb.com",
        //   "password":
        //       "pbkdf2_sha256320000Ny9b6DLCeJXmJhJ0FwKv0T9drX7eDaIagn+pwFzEaPUtjC8JBFopOauuhdrS/L5sc=",
        //   "first_name": null,
        //   "last_name": null,
        //   "mobile_number": null,
        //   "profile_picture":
        //       "/media/profile/batman_car_night-wallpaper-3840x2160.webp",
        //   "auth_provider": "email",
        //   "is_active": true,
        //   "is_verify": true,
        //   "is_staff": true,
        //   "is_email_verify": true,
        //   "groups": [],
        //   "group_data": [],
        //   "date_joined": "2022-09-01T18:33:31+05:30",
        //   "last_login": "2022-10-27T14:01:02.333768+05:30"
        // };

        // prefs.setString('userData', jsonEncode(user));

        // final userDataPref = prefs.get(('userData'));

        // debugPrint(userDataPref.toString());

        final dictUserDataPref = json.decoder(userDataPref);

        // final dictUserDataPref = jsonDecode(userDataPref);
        print(dictUserDataPref);
        print('profile data ===========>' + dictUserDataPref.toString());

        // userAuth.userprofile = dictUserDataPref;
        // print('profile data ===========>${userAuth.userprofile.runtimeType}');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final userAuth = Provider.of<UserAuth>(context);

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
