import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:addcafe/footer.dart';
import 'package:addcafe/Drower/drawerHeader.dart';
import 'package:addcafe/Drower/drawerList.dart';
import 'package:addcafe/appBar.dart';

class Faq extends StatefulWidget {
  const Faq({super.key});

  @override
  State<Faq> createState() => _FaqState();
}

class _FaqState extends State<Faq> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        // <------------------------------ Main App bar starts --------------------->
        // appBar: Appbar(),
        // AppBar(
        //   elevation: 0,
        //   title: Image.asset(
        //     'assets/images/addweb.png', height: 100, width: 200,
        //     // ),
        //   ),
        //   actions: [
        //     IconButton(
        //       onPressed: () {},
        //       icon: const Icon(Icons.notifications),
        //     )
        //   ],
        // ),

        // <---------------------- Drawer/ Side menu starts from here----------->
        // drawer: Drawer(
        //   child: SingleChildScrollView(
        //     child: Column(
        //       crossAxisAlignment: CrossAxisAlignment.start,
        //       children: [
        //         Container(
        //           decoration: BoxDecoration(
        //             color: Colors.red,
        //           ),
        //           child: Column(children: [
        //             DrowerHeader(),
        //           ]),
        //         ),
        //         Container(
        //           child: MyDrowerList(),
        //         )
        //       ],
        //     ),
        //   ),
        // ),
        // <---------------------- Bottom navigation bar starts----------->
        // bottomNavigationBar: theFooter(),

        //  ÷<------------------Main Body ------------------>
        body: Container());
  }
}
