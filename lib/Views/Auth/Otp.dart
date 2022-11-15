import '../../Styles/ColorStyle.dart';
import '../../Views/MyHomePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './Signup.dart';
import 'package:get/get.dart';
import 'package:addcafe/GetxController/UserAuth_controller.dart';
import '../../Components/IndicatorSlider.dart';
import '../../Styles/TextStyles.dart';
import '../../Components/ElevatedButtonCustom.dart';
import '../../Components/TextFieldCustom.dart';
import '../../Components/TextRichCustom.dart';
import '../../Styles/ImageStyle.dart';
import '../../Components/logoCustom.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
// import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class Otp extends StatelessWidget {
  Otp({super.key});

  final controller = Get.put(UserAuth());
  @override
  Widget build(BuildContext context) {
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

                  SizedBox(
                    height: 5,
                  ),
                  Text('Please Sign In to your account',
                      style: TextStylesCustom.textStyles_16),
                  const SizedBox(
                    height: 10,
                  ),

                  Form(
                    child: OtpTextField(
                      // fieldWidth: 30,
                      // handleControllers: controller.otp.value,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      numberOfFields: 6,
                      borderColor: Color.fromARGB(255, 207, 34, 34),
                      //set to true to show as box or false to show as dash
                      showFieldAsBox: false,
                      //runs when a code is typed in
                      onCodeChanged: (String code) {
                        //handle validation or checks here
                      },
                      //runs when every textfield is filled
                      onSubmit: (String verificationCode) {
                        // otpcode = verificationCode;
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
                      controller.continueToPasswordOrOtp();
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
                              border:
                                  Border.all(color: Colors.grey, width: 0.5)),
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
                              border:
                                  Border.all(color: Colors.grey, width: 0.5)),
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
  }
}
