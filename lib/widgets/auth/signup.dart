// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

// import 'dart:html';
import 'package:provider/provider.dart';
import 'dart:io';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:addcafe/main.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import './otp.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:addcafe/Providers/apis/UserAuth.dart';
// import '../splash.dart';

// void main() {
//   runApp(Mylogin());
// }

class Signup extends StatefulWidget {
  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void Validate() {
    if (formKey.currentState!.validate()) {
      Registration();
      print('ok');
    } else {
      print('Error');
    }
  }

  final data = [
    {"id": "2", "image": "assets/images/facebook.png", "name": "Burger"},
    {"id": "3", "image": "assets/images/google.webp", "name": "Cake"},
  ];

  var _isObscure = true;
// _SignupState({required this.Name,this.phone,required this.email,required this.password})
  late String Name = '';
  late var phone = null;
  late var mobile = phone.toString().substring(3);
  late String email = '';
  late String password = '';

  @override
  Widget build(BuildContext context) {
    // final SignupApi = Provider.of<UserAuth>(context);
    return Scaffold(
        body: SingleChildScrollView(
      child: Form(
          key: formKey,
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
                        style: TextStyle(
                            fontWeight: FontWeight.w900, fontSize: 30)),
                    // color: Colors.white,
                  ),
                  Positioned(
                      left: 0,
                      // right: 199,
                      child: IconButton(
                        onPressed: () =>
                            Navigator.pushNamed(context, '/signin'),
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
              Container(
                  margin:
                      EdgeInsets.only(left: 30, right: 30, top: 40, bottom: 10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Color(0xffeeeeee),
                            blurRadius: 10,
                            offset: Offset(0, 4))
                      ],
                      borderRadius: BorderRadius.circular(8),
                      border:
                          Border.all(color: Colors.black.withOpacity(0.13))),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Required";
                      } else {
                        return null;
                      }
                    },
                    keyboardType: TextInputType.text,
                    onChanged: (text) {
                      setState(() {
                        this.Name = text;
                      });
                    },
                    decoration: InputDecoration(
                        fillColor: Colors.black,
                        focusColor: Colors.black,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        labelText: 'Full Name',
                        labelStyle: TextStyle(color: Colors.black)),
                  )),

              // .....................Email field ..........................
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  padding: EdgeInsets.symmetric(),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Color(0xffeeeeee),
                            blurRadius: 10,
                            offset: Offset(0, 4))
                      ],
                      borderRadius: BorderRadius.circular(8),
                      border:
                          Border.all(color: Colors.black.withOpacity(0.13))),
                  child: TextFormField(
                    validator:
                        EmailValidator(errorText: 'Please Enter a valid Email'),
                    onChanged: (text) {
                      setState(() {
                        this.email = text;
                      });
                    },
                    decoration: InputDecoration(
                        fillColor: Colors.black,
                        focusColor: Colors.black,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        labelText: 'Email',
                        labelStyle: TextStyle(color: Colors.black)),
                  )),
              // .....................Mobile field ..........................
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Color(0xffeeeeee),
                            blurRadius: 10,
                            offset: Offset(0, 4))
                      ],
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.grey)),
                  child: InternationalPhoneNumberInput(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Required";
                      } else {
                        return null;
                      }
                    },
                    errorMessage: 'Invalid phone number',
                    selectorTextStyle: TextStyle(color: Colors.black),
                    selectorConfig: SelectorConfig(
                        selectorType: PhoneInputSelectorType.BOTTOM_SHEET),
                    keyboardType: TextInputType.phone,
                    inputBorder: InputBorder.none,
                    onInputChanged: (PhoneNumber number) {
                      this.phone = number.phoneNumber;
                      // this.phone = this.phone.substring(1, 10);
                      print(this.phone);
                    },
                    onInputValidated: (bool value) {
                      print(value);
                    },
                  )),
              // .....................Password field ..........................
              Container(
                margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Color(0xffeeeeee),
                          blurRadius: 10,
                          offset: Offset(0, 4))
                    ],
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.black.withOpacity(0.13))),
                child: TextFormField(
                  // keyboardType: TextInputType.pas,
                  obscureText: _isObscure,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Required";
                    } else {
                      return null;
                    }
                  },
                  onChanged: (text) {
                    setState(() {
                      this.password = text;
                    });
                  },
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isObscure ? Icons.visibility : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            _isObscure = !_isObscure;
                          });
                        },
                      ),
                      hintText: '*************',
                      fillColor: Colors.black,
                      focusColor: Colors.black,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      labelText: 'Password',
                      labelStyle: TextStyle(color: Colors.black)),
                ),
              ),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  child: MaterialButton(
                    height: 50,
                    minWidth: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    onPressed: () {
                      // Registration();
                      Validate();

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
                    children: (data as List).map((item) {
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
                      onPressed: () => Navigator.pushNamed(context, '/signin'),
                      child: Text('SIGNIN'))
                ],
              ),
            ],
          )),
    ));
  }

  Future Registration() async {
    print('object');
    final SignupApi = Provider.of<UserAuth>(context, listen: false);
    Map mapedData = {
      "email": this.email,
      "password": this.password,
      "first_name": this.password,
      "mobile_number": this.phone.substring(2, 11)
    };
    SignupApi.signUp(mapedData, context);
    // .then((res) => {
    //       print('DATA: ${res}'),
    //       if (res.statusCode == 201)
    //         {Navigator.pushNamed(context, '/Otp', arguments: this.mobile)}
    //     })
    // .catchError((onError) => {print(onError)});
    // var APIURL = "https://cafe.addwebprojects.com/api/v1/accounts/signup/";
  }
}
