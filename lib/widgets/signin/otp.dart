import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/services.dart';
import './signin.dart';

class Otp extends StatelessWidget {
  const Otp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        // margin: EdgeInsets.only(top: 100),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 60),
              width: double.infinity,
              height: 50,
              child: Stack(children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 100, vertical: 5),
                  child: Text(
                    'Otp Verification',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
                Positioned(
                    left: 5,
                    child: MaterialButton(
                      child: Icon(
                        Icons.arrow_back_ios_new,
                        size: 30,
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
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: Text('We have sent a verification code to ',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 80),
                  child: Text('+91-9876543211',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                ),
              ],
            ),
            Form(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 55,
                    width: 50,
                    child: TextFormField(
                      onSaved: (pin1) {},
                      decoration: const InputDecoration(
                        hintText: '0',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (value) {
                        if (value.length == 1) {
                          FocusScope.of(context).nextFocus();
                        }
                      },
                      style: Theme.of(context).textTheme.headline6,
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.name,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                        FilteringTextInputFormatter.digitsOnly
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 55,
                    width: 50,
                    child: TextFormField(
                      onSaved: (pin1) {},
                      decoration: const InputDecoration(
                        hintText: '0',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (value) {
                        if (value.length == 1) {
                          FocusScope.of(context).nextFocus();
                        }
                      },
                      style: Theme.of(context).textTheme.headline6,
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.name,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                        FilteringTextInputFormatter.digitsOnly
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 55,
                    width: 50,
                    child: TextFormField(
                      onSaved: (pin1) {},
                      decoration: const InputDecoration(
                        hintText: '0',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (value) {
                        if (value.length == 1) {
                          FocusScope.of(context).nextFocus();
                        }
                      },
                      style: Theme.of(context).textTheme.headline6,
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.name,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                        FilteringTextInputFormatter.digitsOnly
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 55,
                    width: 50,
                    child: TextFormField(
                      onSaved: (pin1) {},
                      decoration: const InputDecoration(
                        hintText: '0',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (value) {
                        if (value.length == 1) {
                          FocusScope.of(context).nextFocus();
                        }
                      },
                      style: Theme.of(context).textTheme.headline6,
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.name,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                        FilteringTextInputFormatter.digitsOnly
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 55,
                    width: 50,
                    child: TextFormField(
                      onSaved: (pin1) {},
                      decoration: const InputDecoration(
                        hintText: '0',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (value) {
                        if (value.length == 1) {
                          FocusScope.of(context).nextFocus();
                        }
                      },
                      style: Theme.of(context).textTheme.headline6,
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                        FilteringTextInputFormatter.digitsOnly
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 55,
                    width: 50,
                    child: TextFormField(
                      onSaved: (pin1) {},
                      decoration: const InputDecoration(
                        hintText: '0',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (value) {
                        if (value.length == 1) {
                          FocusScope.of(context).nextFocus();
                        }
                      },
                      style: Theme.of(context).textTheme.headline6,
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.name,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                        FilteringTextInputFormatter.digitsOnly
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                    child: MaterialButton(
                      // height: 50,
                      minWidth: 180,
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Otp()));
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
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Otp()));
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
}
