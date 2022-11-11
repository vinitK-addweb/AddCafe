// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import './Signin.dart';
import 'dart:io';
import 'package:addcafe/main.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:addcafe/Components/TextFieldCustom.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:addcafe/Components/PasswordFieldCustom.dart';
import 'package:get/get.dart';
import 'package:addcafe/GetxController/UserAuth_controller.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class Signup extends StatelessWidget {
  final controller = Get.put(UserAuth());

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Form(
          child: Column(
        children: [
          SizedBox(
            height: 60,
          ),
          Container(
            child: Stack(children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 80, vertical: 5),
                child: Text('Hola Foordies!',
                    style:
                        TextStyle(fontWeight: FontWeight.w900, fontSize: 30)),
              ),
              Positioned(
                  left: 0,
                  child: IconButton(
                    onPressed: () => Get.to(() => Mylogin()),
                    icon: Icon(Icons.arrow_back_ios_new),
                  )),
            ]),
          ),
          Container(
            margin: EdgeInsets.only(top: 30),
            child: Text('Log in Or Sign up',
                style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 20,
                    color: Colors.grey)),
          ),

          // .....................Full name field ..........................
          TextFieldBase(
              controller: controller.fullName.value,
              hintText: 'John Wilsmith',
              margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              labelText: 'Full Name',
              radiusBorder: 10),

          // .....................Email field ..........................
          TextFieldBase(
              controller: controller.email.value,
              hintText: 'anc@mail.com',
              margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              labelText: 'Email'),

          // .....................Mobile field ..........................

          Container(
              margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              child: IntlPhoneField(
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                  border: OutlineInputBorder(
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
              )),
          // .....................Password field ..........................
          PasswordFieldBase(
            margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            textcontroller: controller.password.value,
            labelText: 'Password',
            hintText: '***********',
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            width: double.infinity,
            child: Text(
              "Password Must be \n"
              "Minimum 1 Upper case \n"
              "Minimum 1 lowercase \n"
              "Minimum 1 Numeric Number \n"
              "Minimum 1 Special Character \n",
              textAlign: TextAlign.left,
              style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
            ),
          ),
          // .....................Confirm  Password field ..........................
          PasswordFieldBase(
            textcontroller: controller.cPassword.value,
            margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            labelText: 'Confirm Password',
            hintText: '***********',
          ),
          Container(
              margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              child: MaterialButton(
                height: 50,
                minWidth: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                onPressed: () {
                  // print('fullName ');
                  // print(controller.cPassword.text);
                  // Registration();
                  controller.SignUpValidation();
                  // Navigator.push(
                  //     context, MaterialPageRoute(builder: (context) => Otp())
                  //     );
                },
                child: Text('Sign Up'),
                color: Colors.red,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
              )),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Text('Or'),
          ),
          Center(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: (controller.data as List).map((item) {
                  return Container(
                    margin: EdgeInsets.all(10),
                    width: 50,
                    child: InkWell(
                      child: Column(
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage(item['image']),
                            radius: 20,
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList()),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Already have an account?'),
              TextButton(
                  onPressed: () => {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => Mylogin()))
                      },
                  child: Text('SIGNIN'))
            ],
          ),
        ],
      )),
    ));
  }
}
