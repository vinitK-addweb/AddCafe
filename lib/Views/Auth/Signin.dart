import 'package:addcafe/Styles/ColorStyle.dart';
import 'package:addcafe/Views/MyHomePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../BottomNavBar.dart';
import '../../Utils/Global.dart';
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
          this.mobile = text;
          print("number");
        } else {
          this.email = text;
          print("string");
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
                                // navigateMultiBottom(
                                //     context, BottomNavBarCustom());
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
                          style:
                              // TextStyle(fontWeight: FontWeight.w900, fontSize: 30)
                              TextStylesCustom.textStyles_40
                                  .apply(fontWeightDelta: 5)),

                      // margin: EdgeInsets.symmetric(vertical: 20),
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
                        // keyboardType: TextInputType.number,
                        labelText: 'Phone Number or Email',
                        // readOnly: true,
                        // controller: controller.textController.value,
                        colorHint:
                            ColorStyle.secondryColorBlack.withOpacity(0.4),
                        hintText: 'John@mail.com',

                        textStyle: TextStylesCustom.textStyles_20,
                      ),
                      // TextFieldUnderline(
                      //   padding: const EdgeInsets.all(10),
                      //   labelText: 'Phone Number or Email',
                      //   controller: controller.textController.value,
                      //   hintText: 'John',
                      //   textStyle: TextStylesCustom.textStyles_20,
                      // ),

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
