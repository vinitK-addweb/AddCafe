import 'package:get/get.dart';
import '../../BottomNavBar.dart';
import '../../Utils/Global.dart';
import '../../Styles/TextStyles.dart';
import '../../Styles/ImageStyle.dart';
import '../../Styles/ColorStyle.dart';
import '../../Views/Auth/Signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../Components/logoCustom.dart';
import '../../Components/TextRichCustom.dart';
import '../../Views/Auth/ForgetPassword.dart';
import '../../Components/IndicatorSlider.dart';
import '../../Components/TextFieldCustom.dart';
import '../../Components/ElevatedButtonCustom.dart';
import '../../GetxController/UserAuth_controller.dart';

class Password extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
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
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    const LogoCustom(),
                    const SizedBox(
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
                              navigateMultiBottom(
                                  context, BottamNavigationBar());
                            },
                            child: Text(
                              'Skip',
                              style: TextStylesCustom.textStyles_16
                                  .apply(color: Colors.white),
                            ),
                          )),
                    ]),
                    Form(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        Text('Welcome',
                            style: TextStylesCustom.textStyles_40
                                .apply(fontWeightDelta: 5)),

                        const SizedBox(
                          height: 5,
                        ),
                        Text('Please Sign In to your account',
                            style: TextStylesCustom.textStyles_16
                                .apply(color: ColorStyle.secondaryColorgrey)),
                        const SizedBox(
                          height: 10,
                        ),

                        Form(
                          key: formKey,
                          child: PasswordFieldUnderline(
                            controller: controller.password.value,
                            padding: const EdgeInsets.all(10),
                            labelText: 'Enter Your Password',
                            hintText: '*********',
                            textStyle: TextStylesCustom.textStyles_20,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please Enter your Password";
                              } else {
                                return null;
                              }
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextButton(
                            onPressed: () {
                              Get.to(ForgetPassword());
                            },
                            child: Text('Forget Password ?',
                                style: TextStylesCustom.textStyles_14)),

                        const SizedBox(
                          height: 20,
                        ),
                        // <-----------------------Submit Button ------------------------------>

                        ElevatedButtonCustom(
                          BgColor: ColorStyle.primaryColorRed,
                          text: 'Continue',
                          size: Size(MediaQuery.of(context).size.width, 50),
                          onTap: (() {
                            if (formKey.currentState!.validate()) {
                              controller.signIn();
                            }
                          }),
                        ),
                        const SizedBox(
                          height: 42,
                        ),

                        Row(
                          children: [
                            Expanded(
                                child: Container(
                              height: 1,
                              color: Colors.grey,
                            )),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Or',
                              style: TextStylesCustom.textStyles_17,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                                child: Container(
                              height: 1,
                              color: Colors.grey,
                            )),
                          ],
                        ),
                        const SizedBox(
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
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    border: Border.all(
                                        color: Colors.grey, width: 0.5)),
                                child: Image.asset(
                                  ImageStyle.google,
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
                            textFirst: 'Don\'t have an account? ',
                            textSecond: 'SIGNUP',
                            onTap: () {
                              Get.to(Signup());
                            },
                          ),
                        ),
                      ],
                    )),
                  ],
                ),
              ));
          // );
        });
  }
}
