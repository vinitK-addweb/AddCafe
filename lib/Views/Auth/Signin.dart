import './Signup.dart';
import 'package:get/get.dart';
import '../../Styles/TextStyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../Components/logoCustom.dart';
import '../../Components/TextRichCustom.dart';
import 'package:addcafe/Views/MyHomePage.dart';
import '../../Components/IndicatorSlider.dart';
import '../../Components/TextFieldCustom.dart';
import 'package:addcafe/Styles/ColorStyle.dart';
import '../../Components/ElevatedButtonCustom.dart';
import 'package:addcafe/GetxController/UserAuth_controller.dart';

// import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class Mylogin extends StatefulWidget {
  @override
  State<Mylogin> createState() => _MyloginState();
}

class _MyloginState extends State<Mylogin> {
  final controller = Get.put(UserAuth());
  var formKey = GlobalKey<FormState>();

  var email = '';
  late var phone = null;

  late var mobile = '';

  @override
  Widget build(BuildContext context) {
    Future _singin(text) async {
      setState(() {
        if (double.tryParse(text) != null) {
          mobile = text;
        } else {
          email = text;
        }
        ;
      });
    }

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
                height: 20,
              ),
              const LogoCustom(),
              Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
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
                      const SizedBox(
                        height: 40,
                      ),
                      Text('Welcome',
                          style: TextStylesCustom.textStyles_40
                              .apply(fontWeightDelta: 5)),

                      const SizedBox(
                        height: 5,
                      ),
                      Text('Please Sign In to your account',
                          style: TextStylesCustom.textStyles_16),
                      const SizedBox(
                        height: 20,
                      ),
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
                        controller: controller.textController.value,
                        labelText: 'Phone Number or Email',
                        colorHint:
                            ColorStyle.secondryColorBlack.withOpacity(0.4),
                        hintText: 'John@mail.com',
                        textStyle: TextStylesCustom.textStyles_20,
                      ),

                      const SizedBox(
                        height: 25,
                      ),
                      // <-----------------------Submit Button ------------------------------>

                      ElevatedButtonCustom(
                        BgColor: ColorStyle.primaryColorRed,
                        text: 'Continue',
                        size: Size(MediaQuery.of(context).size.width, 50),
                        onTap: (() {
                          if (formKey.currentState!.validate()) {
                            controller.continueToPasswordOrOtp();
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
                      Center(
                        child: TextRichCustom(
                          textFirst: 'Don\'t have an account? ',
                          textSecond: 'SIGNUP',
                          onTap: () {
                            controller.resetFunction();
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
