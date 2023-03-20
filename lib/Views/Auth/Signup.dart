import 'dart:io';
import './Signin.dart';
import 'package:get/get.dart';
import '../../Views/MyHomePage.dart';
import '../../Styles/TextStyles.dart';
import '../../Views/Auth/Signin.dart';
import '../../Styles/ImageStyle.dart';
import '../../Styles/ColorStyle.dart';
import '../../Views/Auth/Signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';
import '../../Components/logoCustom.dart';
import '../../Components/TextRichCustom.dart';
import '../../Components/IndicatorSlider.dart';
import '../../Components/TextFieldCustom.dart';
import '../../Components/ElevatedButtonCustom.dart';
import '../../GetxController/UserAuth_controller.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

// import 'package:provider/provider.dart';
// import 'package:addcafe/Components/PasswordFieldCustom.dart';

class Signup extends StatelessWidget {
  final controller = Get.put(UserAuth());

  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserAuth());

    return GetBuilder(
        init: UserAuth(),
        builder: (_) {
          return Scaffold(
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        Text('Hola Foodies!',
                            style: TextStylesCustom.textStyles_30
                                .apply(fontWeightDelta: 5)),

                        SizedBox(
                          height: 5,
                        ),
                        Text('Register to get the best benefits!',
                            style: TextStylesCustom.textStyles_16
                                .apply(color: ColorStyle.secondaryColorgrey)),
                        const SizedBox(
                          height: 10,
                        ),

                        Form(
                          key: formKey,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: TextFormFieldUnderline(
                                      padding: EdgeInsets.all(10),
                                      labelText: 'First Name',
                                      controller: controller.firstName.value,
                                      hintText: 'Joh',
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Enter Your First Name';
                                        } else {
                                          return null;
                                        }
                                      },
                                      textStyle: TextStylesCustom.textStyles_20,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: TextFormFieldUnderline(
                                      padding: EdgeInsets.all(10),
                                      labelText: 'Last Name',
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Enter Your Last Name';
                                        } else {
                                          return null;
                                        }
                                      },
                                      controller: controller.lastName.value,
                                      hintText: 'Joh',
                                      textStyle: TextStylesCustom.textStyles_20,
                                    ),
                                  ),
                                ],
                              ),
                              // --------------- Email field ---------------------->
                              TextFormFieldUnderline(
                                padding: const EdgeInsets.all(10),
                                validator: (value) {
                                  if (double.tryParse(value!) != null) {
                                    if (value.length != 10) {
                                      return 'Enter a Valid Mobile No. Or Email Address';
                                    } else {
                                      return null;
                                    }
                                  } else {
                                    if (!GetUtils.isEmail(value)) {
                                      return 'Enter a Valid Email Address Or Mobile No.';
                                    } else {
                                      return null;
                                    }
                                  }
                                },
                                controller: controller.email.value,
                                labelText: 'Phone Number or Email',
                                colorHint: ColorStyle.secondryColorBlack
                                    .withOpacity(0.4),
                                hintText: 'John@mail.com',
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
                                  controller.phone.value.text = mob.toString();
                                  print(phone.completeNumber);
                                },
                              ),
                              // --------------- password field ---------------------->
                              PasswordFieldUnderline(
                                  controller: controller.password.value,
                                  padding: const EdgeInsets.all(10),
                                  labelText: 'Enter New Password',
                                  hintText: '*********',
                                  textStyle: TextStylesCustom.textStyles_16,
                                  validator: (value) {
                                    RegExp regex = RegExp(
                                        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                                    var passNonNullValue = value ?? "";
                                    if (passNonNullValue.isEmpty) {
                                      return ("Password is required");
                                    } else if (passNonNullValue.length < 6) {
                                      return ("Password Must be more than 5 characters");
                                    } else if (!regex
                                        .hasMatch(passNonNullValue)) {
                                      return ("Password Must upper,lower,digit & Special character ");
                                    }
                                    return null;
                                  }),
                              const SizedBox(
                                height: 10,
                              ),
                              PasswordFieldUnderline(
                                  controller: controller.cPassword.value,
                                  padding: const EdgeInsets.all(10),
                                  labelText: 'Confirm New Password',
                                  hintText: '*********',
                                  textStyle: TextStylesCustom.textStyles_16,
                                  validator: (value) {
                                    if (controller.password.value.text !=
                                        controller.cPassword.value.text) {
                                      return ("Your New Password & Current Password is Mismatch");
                                    }

                                    return null;
                                  }),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),

                        // <-----------------------Submit Button ------------------------------>

                        ElevatedButtonCustom(
                          BgColor: ColorStyle.primaryColorRed,
                          text: 'Continue',
                          size: Size(MediaQuery.of(context).size.width, 50),
                          onTap: (() {
                            if (formKey.currentState!.validate()) {
                              controller.SignUpValidation();
                            }
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

                        const SizedBox(
                          height: 24,
                        ),
                        Center(
                          child: TextRichCustom(
                            textFirst: 'Already have an account? ',
                            textSecond: 'SIGNIN',
                            onTap: () {
                              controller.resetFunction();
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
        });
  }
}
