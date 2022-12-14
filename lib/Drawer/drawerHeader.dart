import 'dart:convert';

import 'package:addcafe/Views/Auth/Signin.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';
import 'package:addcafe/GetxController/UserAuth_controller.dart';

import 'package:shared_preferences/shared_preferences.dart';
import '../Utils/Constant.dart';
import '../Styles/TextStyles.dart';
import '../Styles/ColorStyle.dart';
import '../Components/ElevatedButtonCustom.dart';

class DrowerHeader extends StatelessWidget {
  const DrowerHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final userAuth = Get.put(UserAuth());

    return GetBuilder(
        init: UserAuth(),
        initState: ((_) => userAuth.initCustom()),
        builder: (userAuth) {
          return Obx(() {
            return SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.only(top: 35),
                width: double.infinity,
                height: 200,
                padding: const EdgeInsets.only(top: 20.0),
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
                                margin: const EdgeInsets.symmetric(vertical: 8),

                                //  <------------------login button ----------------------------->
                                child: ElevatedButtonCustom(
                                  size: const Size(100, 20),
                                  BgColor: ColorStyle.secondryColorBlack,
                                  onTap: () => Get.to(Mylogin()),
                                  text: 'Login',
                                ),
                              )
                            :
                            // <-------------------user profile details -------------------->
                            Column(
                                children: [
                                  Container(
                                    margin:
                                        const EdgeInsets.symmetric(vertical: 7),
                                    child: Text(
                                      userAuth.userprofile['first_name'] ?? '',
                                      style: TextStylesCustom.textStyles_26
                                          .apply(color: Colors.white),
                                    ),
                                  ),
                                  Text(
                                      userAuth.userprofile.isEmpty
                                          ? '${userAuth.userprofile}'
                                          : userAuth.userprofile['email'] ?? '',
                                      style: TextStylesCustom.textStyles_22
                                          .apply(color: Colors.white)),
                                ],
                              ),
                        // Obx(() =>
                        //     Text('hello--->${userAuth.userprofile['email']}'))
                      ]),
                ),
              ),
            );
          });
        });
  }
}
