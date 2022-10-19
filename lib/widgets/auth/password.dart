import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'dart:io';
import 'package:form_field_validator/form_field_validator.dart';
import './signin.dart';
import 'package:addcafe/Providers/apis/UserAuth.dart';
import 'package:flutter/foundation.dart';

class Password extends StatefulWidget {
  Password(this.email);
  final email;
  @override
  State<Password> createState() => _PasswordState(email);
}

class _PasswordState extends State<Password> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  var _isObscure = true;

  late String password = '';

  _PasswordState(this.email);
  final email;

  @override
  Widget build(BuildContext context) {
    // ---------------get store data---------------->
    final userAuth = Provider.of<UserAuth>(context);

    Future logIn() async {
      print('object');

      // final SignupApi = Provider.of<UserAuth>(context);
      Map mapedData = {
        "email": this.email,
        "password": this.password,
      };

      userAuth.signIn(mapedData, context);

      // .then((res) => {
      //       print('DATA: ${userAuth.userData}'),
      //       if (res.status == 200)
      //         {
      //           print('login')
      //           // Navigator.pushNamed(context, '/Otp', arguments: this.mobile)
      //         }
    }

    // ---------------get store datae end---------------->
    //  ---------------form validation---------------->

    void Validate() {
      if (formKey.currentState!.validate()) {
        logIn();
        print('ok');
      } else {
        print('Error');
      }
    }

    return Scaffold(
        body: SingleChildScrollView(
            child: Container(
      // margin: EdgeInsets.only(top: 100),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 60),
            width: double.infinity,
            height: 50,
            child: Stack(children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 100, vertical: 10),
                child: Text(
                  'Account Verification  ',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
              Positioned(
                  left: 5,
                  child: MaterialButton(
                    child: Icon(
                      Icons.arrow_back_ios_new,
                      size: 25,
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Mylogin()));
                    },
                  )),
            ]),
          ),
          Column(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                child: Text('Welcome ',
                    style:
                        TextStyle(fontSize: 50, fontWeight: FontWeight.bold)),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 80),
                child: Text(
                    'Please Sign In to your account ${userAuth.userData['status']}',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
          Form(
            child:
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
                  style: TextStyle(color: Colors.green, fontSize: 20),
                ),
                // color: Colors.red,
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
                          borderRadius: BorderRadius.circular(12)),
                      padding: EdgeInsets.all(20)),
                  onPressed: () {
                    logIn();
                    ;
                  },
                  child: Text(
                    'Continue',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ))),
          // Container(
          //     margin: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          //     child: MaterialButton(
          //       minWidth: 180,
          //       // padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          //       onPressed: () {
          //         logIn();
          //       },
          //       child: Text('Continue'),
          //       color: Colors.red,
          //       shape: RoundedRectangleBorder(
          //           borderRadius: BorderRadius.circular(5)),
          //     )),
          Container(
            margin: EdgeInsets.only(top: 30),
            child: Image.asset('assets/images/otp.png'),
            // height: 370,
            width: 300,
          ),
        ],
      ),
    )));
  }
}
