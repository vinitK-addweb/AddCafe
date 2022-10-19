// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:addcafe/footer.dart';

import 'package:provider/provider.dart';
import 'package:addcafe/Providers/apis/FaqApi.dart';
// import 'package:addcafe/Drower/drawerHeader.dart';
// import 'package:addcafe/Drower/drawerList.dart';
// import 'package:addcafe/appBar.dart';

class Faq extends StatefulWidget {
  const Faq({super.key});

  @override
  State<Faq> createState() => _FaqState();
}

class _FaqState extends State<Faq> {
  var currentid = 0;

  @override
  Widget build(BuildContext context) {
    final Faqdata = Provider.of<FaqApi>(context);

    return Scaffold(
      // <------------------------------ Main App bar starts --------------------->
      appBar: AppBar(
          title: Text(
        'FAQ',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
      )),

      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
              child: Column(
                  children:
                      // Container(child: Text(''),)

                      // height: 500,
                      // decoration: BoxDecoration(color:),

                      // <------------------ Faq card start-------------->
                      Faqdata.getFaqData.map((e) {
                return Stack(children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        currentid = e['id'];
                      });
                    },
                    child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(20),
                                  topRight: Radius.circular(20)),
                              color: Color.fromARGB(255, 245, 237, 237),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(
                                    '${e["question"]}',
                                    style: TextStyle(
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                // arrow
                                //     ?
                                Visibility(
                                  visible: currentid == e['id'],
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Text(
                                      '${e["answer"]}',
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.blueGrey,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                )
                                // : SizedBox(
                                //     height: 0,
                                //   ),
                              ],
                            ))),
                  ),

                  // <------------------- Right side dropdown arrow ---------------->
                  Positioned(
                      right: 5,
                      child: IconButton(
                        icon: Icon(
                          currentid == e['id']
                              ? Icons.arrow_drop_up
                              : Icons.arrow_drop_down,
                          size: 40,
                        ),
                        onPressed: () => setState(() {
                          currentid = e['id'];
                        }),
                      ))
                ]);
              }).toList()),
            ),
            Container(
                margin: const EdgeInsets.all(10.0),
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                  color: Color.fromARGB(255, 245, 237, 237),
                ),
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/faqs.png',
                      // height: 100,
                      // width: 200,
                    ),
                    Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Text(
                          'Do you have more questions?',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        )),
                    Container(
                        margin: EdgeInsets.only(top: 8, bottom: 20),
                        child: Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontWeight: FontWeight.w600),
                        )),
                    SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    //to set border radius to button
                                    borderRadius: BorderRadius.circular(12)),
                                padding: EdgeInsets.all(20)),
                            onPressed: () {
                              print('email button clicked');
                            },
                            child: Text(
                              'Send Us A Direct Mail',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            )))
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
