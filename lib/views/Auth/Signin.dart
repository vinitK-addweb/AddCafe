import 'package:addcafe/views/MyHomePage.dart';
import 'package:flutter/material.dart';
import './Signup.dart';
import 'package:get/get.dart';
import 'package:addcafe/GetxController/UserAuth_controller.dart';
// import './otp.dart';
// import 'package:form_field_validator/form_field_validator.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
// import 'package:provider/provider.dart';
// import 'package:addcafe/Providers/apis/UserAuth.dart';
// import '../splash.dart';

// void main() {
//   runApp(Mylogin());
// }

class Mylogin extends StatefulWidget {
  @override
  State<Mylogin> createState() => _MyloginState();
}

class _MyloginState extends State<Mylogin> {
  final controller = Get.put(UserAuth());
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
    // final userAuth = Provider.of<UserAuth>(context);
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

      // Map mapedData = {
      //   "mobile_number": this.mobile,
      // };
      // if (mobile != '') {
      //   // userAuth.signIn(mapedData, context);
      //   Navigator.pushNamed(context, '/Otp', arguments: this.mobile);
      // } else
      //   Navigator.pushNamed(context, '/Password', arguments: this.email);

      // final isValid = _formKey.currentState?.validate();

      // if (!isValid!) {
      //   return;
      // }
      // _formKey.currentState!.save();
      // print(await this.mobile);
      // // await Navigator.pushNamed(context, '/Otp', arguments: this.mobile);
      // await Navigator.pushNamed(context, mobile == '' ? '/Password' : '/Otp',
      //     arguments: mobile == '' ? this.email : this.mobile);
    }

    Future logIn() async {
      print('object');

      // final SignupApi = Provider.of<UserAuth>(context);

      // .then((res) => {
      //       print('DATA: ${userAuth.userData}'),
      //       if (res.status == 200)
      //         {
      //           print('login')
      //           // Navigator.pushNamed(context, '/Otp', arguments: this.mobile)
      //         }
    }

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
                child: Text('#1 Food Delivery App',
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
                    controller: controller.textController,
                    onChanged: (text) {},
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
                      controller.continueToPasswordOrOtp();
                      print('hello');
                      print('yo ${controller.textController.text}');
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
                      onPressed: () => {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Signup()))
                          },
                      child: Text('SIGNUP'))
                ],
              ),
            ],
          )),
    ));
  }
}
