import 'package:addcafe/main.dart';
import 'package:flutter/material.dart';
import './otp.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
// import '../splash.dart';

// void main() {
//   runApp(Mylogin());
// }

class Mylogin extends StatefulWidget {
  @override
  State<Mylogin> createState() => _MyloginState();
}

class _MyloginState extends State<Mylogin> {
  var _formKey = GlobalKey<FormState>();
  final data = [
    {"id": "2", "image": "assets/images/facebook.png", "name": "Burger"},
    {"id": "3", "image": "assets/images/google.webp", "name": "Cake"},
  ];
  var email = '';
  late var phone = null;

  late var mobile = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.2,
              ),

              Stack(children: <Widget>[
                // Container(
                //   width: 300,
                //   height: 300,
                //   color: Colors.red,
                // ), //C
                Container(
                  child: Image.asset('assets/images/onboard.png'),
                  // height: 370,
                  width: 300,
                ),
                Positioned(
                    top: 20,
                    right: -2,
                    child: MaterialButton(
                      color: Colors.black45,
                      minWidth: 30,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(55)),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MyHomePage()));
                      },
                      child: Text(
                        'Skip',
                        style: TextStyle(color: Colors.white),
                      ),
                    )),
              ]),
              Container(
                margin: EdgeInsets.all(2),
                child: Text('#1 Food Devlivery App',
                    style:
                        TextStyle(fontWeight: FontWeight.w900, fontSize: 30)),
                // color: Colors.white,
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                child: Text('Log in Or Sign up',
                    style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 20,
                        color: Colors.grey)),
                // color: Colors.white,
              ),

              // <-------------------Mobile number Input feild------------------------------>
              // Container(
              //   margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              //   padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              //   decoration: BoxDecoration(
              //       color: Colors.white,
              //       boxShadow: [
              //         BoxShadow(
              //             color: Color(0xffeeeeee),
              //             blurRadius: 10,
              //             offset: Offset(0, 4))
              //       ],
              //       borderRadius: BorderRadius.circular(8),
              //       border: Border.all(color: Colors.black.withOpacity(0.13))),
              //   child: Stack(children: [
              //     InternationalPhoneNumberInput(
              //       onFieldSubmitted: ((value) {}),
              //       validator: (value) {
              //         if (value!.isEmpty ||
              //             !RegExp(r"^([0|+[0-9]{1,5})?([7-9][0-9]{9})$")
              //                 .hasMatch(value)) {
              //           return 'Enter a valid Mobile!';
              //         }
              //         return null;
              //       },
              //       errorMessage: 'Invalid phone number',
              //       selectorTextStyle: TextStyle(color: Colors.black),
              //       selectorConfig: SelectorConfig(
              //           selectorType: PhoneInputSelectorType.BOTTOM_SHEET),
              //       keyboardType: TextInputType.phone,
              //       inputBorder: InputBorder.none,
              //       onInputChanged: (PhoneNumber number) {
              //         setState(() {
              //           mobile = number.phoneNumber.toString().substring(3);
              //         });

              //         print(this.mobile);
              //       },
              //       onInputValidated: (bool value) {
              //         print(value);
              //       },
              //     )
              //   ]),
              // ),
              // ---------------Or text -----------------------
              // Container(
              //   margin: EdgeInsets.symmetric(
              //     horizontal: 10,
              //     // vertical: 10,
              //   ),
              //   child: Text(
              //     'Or',
              //     style: TextStyle(fontSize: 20, color: Colors.grey),
              //   ),
              // ),
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
                    // readOnly: mobile == '' ? false : true,
                    // validator:
                    //     EmailValidator(errorText: 'Please Enter a valid Email'),
                    onChanged: (text) {
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
                    },
                    decoration: InputDecoration(
                        fillColor: Colors.black,
                        focusColor: Colors.black,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        labelText: 'Phone Number or Email',
                        labelStyle: TextStyle(color: Colors.black)),
                  )),
              // <-----------------------Submit Button ------------------------------>
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  child: MaterialButton(
                    height: 50,
                    minWidth: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    onPressed: () {
                      _singin();

                      // Navigator.push(
                      //     context, MaterialPageRoute(builder: (context) => Otp()));
                    },
                    child: Text('Continue'),
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
                  Text('Don\'t have an account?'),
                  TextButton(
                      onPressed: () => Navigator.pushNamed(context, '/signup'),
                      child: Text('SIGNUP'))
                ],
              ),
            ],
          )),
    ));
  }

  Future _singin() async {
    final isValid = _formKey.currentState?.validate();
    if (!isValid!) {
      return;
    }
    _formKey.currentState!.save();
    print(await this.mobile);
    // await Navigator.pushNamed(context, '/Otp', arguments: this.mobile);
    await Navigator.pushNamed(context, mobile == '' ? '/Password' : '/Otp',
        arguments: mobile == '' ? this.email : this.mobile);
  }
}
