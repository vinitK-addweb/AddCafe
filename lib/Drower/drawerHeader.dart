// ignore_for_file: prefer_if_null_operators, prefer_const_constructors, avoid_unnecessary_containers

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:addcafe/Providers/apis/UserAuth.dart';
import 'package:provider/provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DrowerHeader extends StatefulWidget {
  @override
  State<DrowerHeader> createState() => _DrowerHeaderState();
}

class _DrowerHeaderState extends State<DrowerHeader> {
  // Map<String, dynamic> userProfile = {};

  @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();

  // }

  @override
  Widget build(BuildContext context) {
    final userAuth = Provider.of<UserAuth>(context);
    // userAuth.getlocaStorage();
    // var _data = userAuth.userprofile;
    // // print(''+ _data.runtimeType);

    return Container(
      margin: EdgeInsets.only(top: 35),
      width: double.infinity,
      height: 200,
      padding: EdgeInsets.only(top: 20.0),
      child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        CircleAvatar(
            radius: 55,
            backgroundImage: NetworkImage(
              userAuth.userprofile.isEmpty
                  ? 'https://mir-s3-cdn-cf.behance.net/user/276/462829507061295.5f9717443f152.png'
                  : userAuth.userprofile['profile_picture'] == null
                      ? 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSi6mIqR-61xHjJUEMUfzQvP_ZeVtRZ-Hh_B9OQIh5hLjVH1ZO5U23ZehKJMmIsZkMF5Ew&usqp=CAU'
                      : '${dotenv.env['IMG_URL']}${userAuth.userprofile['profile_picture']}',
            )),
        userAuth.userprofile.isEmpty
            ? Container(
                margin: EdgeInsets.symmetric(vertical: 8),

                //  <------------------login button ----------------------------->
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.black,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4)),
                        padding: EdgeInsets.symmetric(horizontal: 32)),
                    onPressed: () => Navigator.pushNamed(context, '/signin'),
                    child: Text('Login')))
            :
            // <-------------------user profile details -------------------->
            Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 7),
                    child: Text(
                      userAuth.userprofile['first_name'] == null
                          ? ''
                          : userAuth.userprofile['first_name'],
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    child: Text(
                      userAuth.userprofile == null
                          ? ''
                          : userAuth.userprofile['email'] == null
                              ? ''
                              : userAuth.userprofile['email'],
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  )
                ],
              ),
      ]),
    );
  }
}
