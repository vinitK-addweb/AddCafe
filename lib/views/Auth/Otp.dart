import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'Signin.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:addcafe/GetxController/UserAuth_controller.dart';

class Otp extends StatelessWidget {
  String otpcode = '';

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserAuth());

    Future logIn() async {
      print('object');

      // final SignupApi = Provider.of<UserAuth>(context);
      Map mapedData = {
        // "mobile_number": this.mobile,
        "password": this.otpcode,
      };

      controller.signIn();

      // .then((res) => {
      //       print('DATA: ${userAuth.userData}'),
      //       if (res.status == 200)
      //         {
      //           print('login')
      //           // Navigator.pushNamed(context, '/Otp', arguments: this.mobile)
      //         }
    }

    return Scaffold(
        appBar: AppBar(
            elevation: 1,
            centerTitle: true,
            title: Text(
              'Otp Verification',
              style: TextStyle(fontSize: 28),
            )),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(top: 90),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: Text('We have sent a verification code to ',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 80),
                  child: Text('+91- ${controller.textController.value.text}',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                ),
                Form(
                  child: OtpTextField(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    numberOfFields: 6,
                    borderColor: Color.fromARGB(255, 207, 34, 34),
                    //set to true to show as box or false to show as dash
                    showFieldAsBox: true,
                    //runs when a code is typed in
                    onCodeChanged: (String code) {
                      //handle validation or checks here
                    },
                    //runs when every textfield is filled
                    onSubmit: (String verificationCode) {
                      otpcode = verificationCode;
                      // showDialog(
                      //     context: context,
                      //     builder: (context) {
                      //       return AlertDialog(
                      //         title: Text("Verification Code"),
                      //         content: Text('Code entered is $verificationCode'),
                      //       );
                      //     });
                    }, // end onSubmit
                  ),
                ),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                        child: MaterialButton(
                          // height: 50,
                          minWidth: 180,
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          onPressed: () {
                            Otpcheck();
                            //   Navigator.push(context,
                            //       MaterialPageRoute(builder: (context) => Otp()));
                            //
                          },
                          child: Text('Continue'),
                          color: Colors.red,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                        )),
                    Container(
                        margin: EdgeInsets.symmetric(vertical: 32),
                        child: MaterialButton(
                          // height: 50,
                          minWidth: 110,
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 12),
                          onPressed: () {
                            // Navigator.push(context,
                            //     MaterialPageRoute(builder: (context) => Otp()));
                          },
                          child: Text(
                            'Resend OTP',
                            style: TextStyle(color: Colors.green, fontSize: 20),
                          ),
                          // color: Colors.red,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                        )),
                  ],
                ),
                Container(
                  child: Image.asset('assets/images/otp.png'),
                  // height: 370,
                  width: 300,
                ),
              ],
            ),
          ),
        ));
  }

  Future Otpcheck() async {}
}