// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../Views/MyHomePage.dart';
// import 'package:provider/provider.dart';
import 'dart:io';
// import 'package:addcafe/Components/PasswordFieldCustom.dart';
import './Signin.dart';
import 'package:get/get.dart';
import '../../GetxController/UserAuth_controller.dart';
import 'package:flutter/foundation.dart';
import '../../Components/IndicatorSlider.dart';
import '../../Styles/TextStyles.dart';
import '../../Components/ElevatedButtonCustom.dart';
import '../../Components/TextFieldCustom.dart';
import '../../Components/TextRichCustom.dart';
import '../../Views/Auth/Signin.dart';
import '../../Styles/ImageStyle.dart';
import '../../Styles/ColorStyle.dart';
import '../../Views/Auth/Signup.dart';
import '../../Components/logoCustom.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class Signup extends StatelessWidget {
  final controller = Get.put(UserAuth());

  @override
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserAuth());

    return GetBuilder(
        init: UserAuth(),
        builder: (_) {
          return
              // Obx(
              //   () =>
              Scaffold(
                  appBar: PreferredSize(
                    preferredSize: const Size.fromHeight(0),
                    child: AppBar(
                      elevation: 0,
                      backgroundColor: Colors.transparent,
                      systemOverlayStyle: SystemUiOverlayStyle.dark,
                    ),
                  ),
                  body: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        LogoCustom(),
                        SizedBox(
                          height: 10,
                        ),
                        Stack(children: <Widget>[
                          CustomIndicator(),
                          Positioned(
                              top: 10,
                              right: 20,
                              child: MaterialButton(
                                color: ColorStyle.secondryColorRed,
                                minWidth: 70,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(55)),
                                onPressed: () {
                                  Get.to(MyHomePage());
                                },
                                child: Text(
                                  'Skip',
                                  style: TextStylesCustom.textStyles_16
                                      .apply(color: Colors.white),
                                ),
                              )),
                        ]),
                        Column(
                          // mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 30,
                            ),
                            Text('Hola Foodies!',
                                style:
                                    // TextStyle(fontWeight: FontWeight.w900, fontSize: 30)
                                    TextStylesCustom.textStyles_40
                                        .apply(fontWeightDelta: 5)),

                            // margin: EdgeInsets.symmetric(vertical: 20),
                            SizedBox(
                              height: 5,
                            ),
                            Text('Register to get the best benefits!',
                                style: TextStylesCustom.textStyles_16.apply(
                                    color: ColorStyle.secondaryColorgrey)),
                            const SizedBox(
                              height: 10,
                            ),

                            Form(
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: TextFieldUnderline(
                                          padding: EdgeInsets.all(10),
                                          labelText: 'First Name',
                                          controller:
                                              controller.firstName.value,
                                          hintText: 'Joh',
                                          textStyle:
                                              TextStylesCustom.textStyles_20,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                        child: TextFieldUnderline(
                                          padding: EdgeInsets.all(10),
                                          labelText: 'Last Name',
                                          controller: controller.lastName.value,
                                          hintText: 'Joh',
                                          textStyle:
                                              TextStylesCustom.textStyles_20,
                                        ),
                                      ),
                                    ],
                                  ),
                                  // --------------- Email field ---------------------->
                                  TextFieldUnderline(
                                    padding: EdgeInsets.all(10),
                                    labelText: 'Email Address',
                                    controller: controller.email.value,
                                    hintText: 'Johndo@mail.com',
                                    textStyle: TextStylesCustom.textStyles_20,
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  //       // .....................Mobile field ..........................

                                  IntlPhoneField(
                                    style: TextStylesCustom.textStyles_20,
                                    decoration: InputDecoration(
                                      focusColor: ColorStyle.secondaryColorgrey,
                                      labelText: 'Phone Number',
                                      border: UnderlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide: BorderSide(),
                                      ),
                                    ),
                                    initialCountryCode: 'IN',
                                    onChanged: (phone) {
                                      var mob = phone.completeNumber;
                                      controller.phone.value.text =
                                          mob.toString();
                                      print(phone.completeNumber);
                                    },
                                  ),
                                  // --------------- password field ---------------------->
                                  TextFieldUnderline(
                                    padding: EdgeInsets.all(10),
                                    labelText: 'Password',
                                    controller: controller.password.value,
                                    hintText: '*********',
                                    textStyle: TextStylesCustom.textStyles_20,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            // TextButton(
                            //     onPressed: () {},
                            //     child: Text('Forget Password',
                            //         style: TextStylesCustom.textStyles_14)),

                            // const SizedBox(
                            //   height: 15,
                            // ),
                            // <-----------------------Submit Button ------------------------------>

                            ElevatedButtonCustom(
                              BgColor: ColorStyle.primaryColorRed,
                              text: 'Continue',
                              size: Size(MediaQuery.of(context).size.width, 50),
                              onTap: (() {
                                controller.SignUpValidation();
                              }),
                            ),
                            SizedBox(
                              height: 42,
                            ),

                            Row(
                              children: [
                                Expanded(
                                    child: Container(
                                  height: 1,
                                  color: Colors.grey,
                                )),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Or',
                                  style: TextStylesCustom.textStyles_17,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                    child: Container(
                                  height: 1,
                                  color: Colors.grey,
                                )),
                              ],
                            ),
                            SizedBox(
                              height: 24,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: () {},
                                  child: Container(
                                    height: 44,
                                    width: 44,
                                    padding: const EdgeInsets.all(10),

                                    // alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(6),
                                        border: Border.all(
                                            color: Colors.grey, width: 0.5)),
                                    child: Image.asset(
                                      ImageStyle.facebook,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: Container(
                                    height: 44,
                                    width: 44,
                                    padding: const EdgeInsets.all(10),
                                    // alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(6),
                                        border: Border.all(
                                            color: Colors.grey, width: 0.5)),
                                    child: Image.asset(
                                      ImageStyle.google,
                                      // fit: BoxFit.cover,
                                      // height: 10,
                                      // width: 10,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 24,
                            ),
                            Center(
                              child: TextRichCustom(
                                textFirst: 'Already have an account? ',
                                textSecond: 'SIGNIN',
                                onTap: () {
                                  Get.to(Mylogin());
                                },
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            )
                          ],
                        ),
                      ],
                    ),
                  ));
          // );
        });

    ;

    // Scaffold(
    //     body: SingleChildScrollView(
    //   child: Form(
    //       child: Column(
    //     children: [
    //       SizedBox(
    //         height: 60,
    //       ),
    //       Container(
    //         child: Stack(children: [
    //           Container(
    //             width: double.infinity,
    //             padding: EdgeInsets.symmetric(horizontal: 80, vertical: 5),
    //             child: Text('Hola Foordies!',
    //                 style:
    //                     TextStyle(fontWeight: FontWeight.w900, fontSize: 30)),
    //           ),
    //           Positioned(
    //               left: 0,
    //               child: IconButton(
    //                 onPressed: () => Get.to(() => Mylogin()),
    //                 icon: Icon(Icons.arrow_back_ios_new),
    //               )),
    //         ]),
    //       ),
    //       Container(
    //         margin: EdgeInsets.only(top: 30),
    //         child: Text('Log in Or Sign up',
    //             style: TextStyle(
    //                 fontWeight: FontWeight.w900,
    //                 fontSize: 20,
    //                 color: Colors.grey)),
    //       ),

    //       // .....................Full name field ..........................
    //       // TextFieldBase(
    //       //     controller: controller.fullName.value,
    //       //     hintText: 'John Wilsmith',
    //       //     margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
    //       //     labelText: 'Full Name',
    //       //     radiusBorder: 10),

    //       // .....................Email field ..........................
    //       // TextFieldBase(
    //       //     controller: controller.email.value,
    //       //     hintText: 'anc@mail.com',
    //       //     margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
    //       //     labelText: 'Email'),

    //       // .....................Mobile field ..........................

    //       Container(
    //           margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
    //           child: IntlPhoneField(
    //             decoration: InputDecoration(
    //               labelText: 'Phone Number',
    //               border: OutlineInputBorder(
    //                 borderRadius: BorderRadius.circular(8),
    //                 borderSide: BorderSide(),
    //               ),
    //             ),
    //             initialCountryCode: 'IN',
    //             onChanged: (phone) {
    //               var mob = phone.completeNumber;
    //               controller.phone.value.text = mob.toString();
    //               print(phone.completeNumber);
    //             },
    //           )),
    //       // .....................Password field ..........................
    //       PasswordFieldBase(
    //         margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
    //         textcontroller: controller.password.value,
    //         labelText: 'Password',
    //         hintText: '***********',
    //       ),
    //       Container(
    //         margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
    //         width: double.infinity,
    //         child: Text(
    //           "Password Must be \n"
    //           "Minimum 1 Upper case \n"
    //           "Minimum 1 lowercase \n"
    //           "Minimum 1 Numeric Number \n"
    //           "Minimum 1 Special Character \n",
    //           textAlign: TextAlign.left,
    //           style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
    //         ),
    //       ),
    //       // .....................Confirm  Password field ..........................
    //       PasswordFieldBase(
    //         textcontroller: controller.cPassword.value,
    //         margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
    //         labelText: 'Confirm Password',
    //         hintText: '***********',
    //       ),
    //       Container(
    //           margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
    //           child: MaterialButton(
    //             height: 50,
    //             minWidth: double.infinity,
    //             padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    //             onPressed: () {
    //               // print('fullName ');
    //               // print(controller.cPassword.text);
    //               // Registration();
    //               controller.SignUpValidation();
    //               // Navigator.push(
    //               //     context, MaterialPageRoute(builder: (context) => Otp())
    //               //     );
    //             },
    //             child: Text('Sign Up'),
    //             color: Colors.red,
    //             shape: RoundedRectangleBorder(
    //                 borderRadius: BorderRadius.circular(5)),
    //           )),
    //       Container(
    //         margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    //         child: Text('Or'),
    //       ),
    //       Center(
    //         child: Row(
    //             mainAxisAlignment: MainAxisAlignment.center,
    //             children: (controller.data as List).map((item) {
    //               return Container(
    //                 margin: EdgeInsets.all(10),
    //                 width: 50,
    //                 child: InkWell(
    //                   child: Column(
    //                     children: [
    //                       CircleAvatar(
    //                         backgroundImage: AssetImage(item['image']),
    //                         radius: 20,
    //                       ),
    //                     ],
    //                   ),
    //                 ),
    //               );
    //             }).toList()),
    //       ),
    //       Row(
    //         mainAxisAlignment: MainAxisAlignment.center,
    //         children: [
    //           Text('Already have an account?'),
    //           TextButton(
    //               onPressed: () => {
    //                     Navigator.pushReplacement(context,
    //                         MaterialPageRoute(builder: (context) => Mylogin()))
    //                   },
    //               child: Text('SIGNIN'))
    //         ],
    //       ),
    //     ],
    //   )),
    // ));
    // }
  }
}
