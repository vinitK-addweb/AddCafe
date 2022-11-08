import 'dart:convert';

import 'package:addcafe/views/Auth/Signin.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';
import 'package:addcafe/GetxController/UserAuth_controller.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Utils/Constant.dart';

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
    final userAuth = Get.put(UserAuth());
    // userAuth.getlocaStorage();
    // userAuth.getlocaStorage();
    // var _data = userAuth.userprofile;
    print('user profile data================>${userAuth.userprofile}');
    return GetBuilder(
        init: UserAuth(),
        initState: ((_) => userAuth.getlocaStorage()),
        builder: (userAuth) {
          return SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.only(top: 35),
              width: double.infinity,
              height: 200,
              padding: EdgeInsets.only(top: 20.0),
              child: SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CircleAvatar(
                          radius: 55,
                          backgroundImage: NetworkImage(
                            userAuth.userprofile.isEmpty
                                ? 'https://mir-s3-cdn-cf.behance.net/user/276/462829507061295.5f9717443f152.png'
                                : userAuth.userprofile['profile_picture'] ==
                                        null
                                    ? 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSi6mIqR-61xHjJUEMUfzQvP_ZeVtRZ-Hh_B9OQIh5hLjVH1ZO5U23ZehKJMmIsZkMF5Ew&usqp=CAU'
                                    : '${kImgUrl}/${userAuth.userprofile['profile_picture']}',
                          )),
                      userAuth.userprofile.isEmpty
                          ? Container(
                              margin: EdgeInsets.symmetric(vertical: 8),

                              //  <------------------login button ----------------------------->
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      primary: Colors.black,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(4)),
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 32)),
                                  onPressed: () => Get.to(Mylogin()),
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
                                  child: //Text('${userAuth.userprofile}')
                                      Text(
                                    userAuth.userprofile.isEmpty
                                        ? '${userAuth.userprofile}'
                                        : userAuth.userprofile['email'] == null
                                            ? ''
                                            : userAuth.userprofile['email'],
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                      // Obx(() =>
                      //     Text('hello--->${userAuth.userprofile['email']}'))
                    ]),
              ),
            ),
          );
        });
  }
}
