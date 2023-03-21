import './Signup.dart';
import 'package:get/get.dart';
import '../../Views/MyHomePage.dart';
import '../../Styles/ColorStyle.dart';
import '../../Styles/TextStyles.dart';
import '../../Styles/ImageStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../Components/logoCustom.dart';
import '../../Components/TextRichCustom.dart';
import '../../Components/IndicatorSlider.dart';
import '../../Components/ElevatedButtonCustom.dart';
import 'package:addcafe/GetxController/UserAuth_controller.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class Otp extends StatelessWidget {
  Otp({super.key});

  final controller = Get.put(UserAuth());
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
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
                            Get.to(MyHomePage());
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
                      Text('Please Verify Your OTP',
                          style: TextStylesCustom.textStyles_16),
                      const SizedBox(
                        height: 10,
                      ),

                      Form(
                        child: OtpTextField(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          numberOfFields: 6,
                          borderColor: Color.fromARGB(255, 207, 34, 34),

                          showFieldAsBox: false,

                          onCodeChanged: (String code) {
                            controller.otp.value.text = code;
                          },

                          onSubmit: (String verificationCode) {
                            controller.otp.value.text = verificationCode;
                          }, // end onSubmit
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextButton(
                          onPressed: () {},
                          child: Text('Resend OTP',
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
                          controller.verifyOtp();
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
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: [
                      //     InkWell(
                      //       onTap: () {},
                      //       child: Container(
                      //         height: 44,
                      //         width: 44,
                      //         padding: const EdgeInsets.all(10),

                      //         // alignment: Alignment.center,
                      //         decoration: BoxDecoration(
                      //             borderRadius: BorderRadius.circular(6),
                      //             border:
                      //                 Border.all(color: Colors.grey, width: 0.5)),
                      //         child: Image.asset(
                      //           ImageStyle.facebook,
                      //         ),
                      //       ),
                      //     ),
                      //     const SizedBox(
                      //       width: 20,
                      //     ),
                      //     InkWell(
                      //       onTap: () {},
                      //       child: Container(
                      //         height: 44,
                      //         width: 44,
                      //         padding: const EdgeInsets.all(10),
                      //         decoration: BoxDecoration(
                      //             borderRadius: BorderRadius.circular(6),
                      //             border:
                      //                 Border.all(color: Colors.grey, width: 0.5)),
                      //         child: Image.asset(
                      //           ImageStyle.google,
                      //         ),
                      //       ),
                      //     ),
                      //   ],
                      // ),

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
            )));
  }
}
