import 'package:addcafe/Styles/ColorStyle.dart';
import 'package:addcafe/Views/MyHomePage.dart';
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

class ForgetPassword extends StatelessWidget {
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
              const SizedBox(
                height: 20,
              ),
              const LogoCustom(),
              Form(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),

                  CustomIndicator(),

                  const SizedBox(
                    height: 40,
                  ),
                  Text('Don’t Worry',
                      style:
                          // TextStyle(fontWeight: FontWeight.w900, fontSize: 30)
                          TextStylesCustom.textStyles_40
                              .apply(fontWeightDelta: 5)),

                  // margin: EdgeInsets.symmetric(vertical: 20),
                  const SizedBox(
                    height: 5,
                  ),
                  Text('Recover your password here!',
                      style: TextStylesCustom.textStyles_16),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFieldUnderline(
                    padding: const EdgeInsets.all(10),
                    labelText: 'Phone Number or Email',
                    controller: controller.textController.value,
                    hintText: 'John',
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
                      controller.forgetPassword();
                    }),
                  ),
                  const SizedBox(
                    height: 10,
                  ),

                  Center(
                    child: TextButton(
                        onPressed: (() => Get.back()),
                        child: Text(
                          'Back',
                          style: TextStylesCustom.textStyles_26
                              .apply(color: ColorStyle.secondryColorBlack),
                        )),
                  )
                ],
              )),
            ],
          ),
        ));
  }
}
