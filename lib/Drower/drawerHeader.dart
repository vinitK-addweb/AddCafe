// ignore_for_file: prefer_if_null_operators, prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:addcafe/Providers/apis/UserAuth.dart';
import 'package:provider/provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class DrowerHeader extends StatefulWidget {
  @override
  State<DrowerHeader> createState() => _DrowerHeaderState();
}

class _DrowerHeaderState extends State<DrowerHeader> {
  @override
  Widget build(BuildContext context) {
    final userAuth = Provider.of<UserAuth>(context);
    return Container(
      margin: EdgeInsets.only(top: 35),
      width: double.infinity,
      height: 200,
      padding: EdgeInsets.only(top: 20.0),
      child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        CircleAvatar(
            radius: 55,
            backgroundImage: NetworkImage(
              userAuth.userProfile == null
                  ? 'https://mir-s3-cdn-cf.behance.net/user/276/462829507061295.5f9717443f152.png'
                  : '${dotenv.env['IMG_URL']}${userAuth.userProfile['profile_picture']}'
                      ,
            )),

            userAuth.userProfile == null? Container(margin: EdgeInsets.symmetric(vertical: 8), 
            child: ElevatedButton( style:ElevatedButton.styleFrom( primary: Colors.black, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),padding: EdgeInsets.symmetric(horizontal: 32)), onPressed: ()=>Navigator.pushNamed(context, '/signin'), child: Text('Login'))):

        Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 8),
              child: Text(
                // 'Vinit Singh'
                userAuth.userProfile['first_name']== null
                    ? ''
                    : userAuth.userProfile['first_name'],
                style: TextStyle(
                    color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
              Container(

          // margin: EdgeInsets.only(top: 8),
          child: Text(userAuth.userProfile== null
                ? ''
                : userAuth.userProfile['email'] == null?'':userAuth.userProfile['email'] ,
            style: TextStyle(
              color: Colors.black87,
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
