import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:provider/provider.dart';
import 'dart:io';
import 'package:addcafe/Components/PasswordFieldCustom.dart';
import './Signin.dart';
import 'package:get/get.dart';
import '../../GetxController/UserAuth_controller.dart';
import 'package:flutter/foundation.dart';

class Password extends StatelessWidget {
  @override
  var _isObscure = true;

  Widget build(BuildContext context) {
    final controller = Get.put(UserAuth());
    // ---------------get store data---------------->
    // final userAuth = Provider.of<UserAuth>(context);

    // ---------------get store datae end---------------->
    //  ---------------form validation---------------->

    return GetBuilder(
        init: UserAuth(),
        builder: (_) {
          return
              // Obx(
              //   () =>
              Scaffold(
                  appBar: AppBar(
                      elevation: 1,
                      centerTitle: true,
                      title: Text(
                        'Password',
                        style: TextStyle(fontSize: 28),
                      )),
                  body: SingleChildScrollView(
                      child: Container(
                    // margin: EdgeInsets.only(top: 100),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 20),
                          child: Text('Welcome ',
                              style: TextStyle(
                                  fontSize: 50, fontWeight: FontWeight.bold)),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(
                              vertical: 20, horizontal: 30),
                          child: Text(
                              'Please Sign In to your account ${controller.textController.value.text}',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                        ),
                        Form(
                            child: PasswordFieldBase(
                          margin: EdgeInsets.symmetric(
                              horizontal: 25, vertical: 20),
                          hintText: '***********',
                          labelText: 'Password',
                          textcontroller: controller.password.value,
                        )
                            // .....................Password field ..........................

                            //     Container(
                            //   margin: EdgeInsets.symmetric(
                            //       horizontal: 30, vertical: 10),
                            //   decoration: BoxDecoration(
                            //       color: Colors.white,
                            //       boxShadow: [
                            //         BoxShadow(
                            //             color: Color(0xffeeeeee),
                            //             blurRadius: 10,
                            //             offset: Offset(0, 4))
                            //       ],
                            //       borderRadius: BorderRadius.circular(8),
                            //       border: Border.all(
                            //           color: Colors.black.withOpacity(0.13))),
                            //   child: TextFormField(
                            //     controller: controller.password.value,
                            //     decoration: InputDecoration(
                            //         suffixIcon: IconButton(
                            //           icon: Icon(
                            //             _isObscure
                            //                 ? Icons.visibility
                            //                 : Icons.visibility_off,
                            //           ),
                            //           onPressed: () {
                            //             print('here the password' +
                            //                 controller.password.value.text);
                            //             // setState(() {
                            //             //   _isObscure = !_isObscure;
                            //             // });
                            //           },
                            //         ),
                            //         hintText: '*************',
                            //         fillColor: Colors.black,
                            //         focusColor: Colors.black,
                            //         border: OutlineInputBorder(
                            //             borderRadius: BorderRadius.circular(10)),
                            //         labelText: 'Password',
                            //         labelStyle: TextStyle(color: Colors.black)),
                            //   ),
                            // ),
                            ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                                child: MaterialButton(
                              minWidth: 110,
                              padding: EdgeInsets.symmetric(horizontal: 30),
                              onPressed: () {
                                // Navigator.push(context,
                                //     MaterialPageRoute(builder: (context) => Otp()));
                              },
                              child: Text(
                                'Forget Password ?',
                                style: TextStyle(
                                    color: Colors.green, fontSize: 20),
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                            )),
                          ],
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width / 1.2,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        //to set border radius to button
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    padding: EdgeInsets.all(20)),
                                onPressed: () => controller.signIn(),
                                child: Text(
                                  'Continue',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ))),
                        Container(
                          margin: EdgeInsets.only(top: 30),
                          child: Image.asset('assets/images/otp.png'),
                          width: 300,
                        ),
                      ],
                    ),
                  )));
          // );
        });
  }
}
