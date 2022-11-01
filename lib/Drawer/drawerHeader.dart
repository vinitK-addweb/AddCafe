import 'package:flutter/material.dart';

class DrowerHeader extends StatefulWidget {
  @override
  State<DrowerHeader> createState() => _DrowerHeaderState();
}

class _DrowerHeaderState extends State<DrowerHeader> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 35),
      width: double.infinity,
      height: 200,
      padding: EdgeInsets.only(top: 20.0),
      child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        CircleAvatar(
            radius: 55,
            backgroundImage: NetworkImage(
              'https://mir-s3-cdn-cf.behance.net/user/276/462829507061295.5f9717443f152.png',
            )),
        // Container(
        //   margin: EdgeInsets.only(bottom: 10),
        //   height: 70,
        //   decoration: BoxDecoration(
        //       shape: BoxShape.circle,
        //       image: DecorationImage(
        //           image: const AssetImage('/assets/images/user.jpg'))),
        // ),
        Container(
          margin: EdgeInsets.only(top: 8),
          child: Text(
            'Vinit Singh',
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          // margin: EdgeInsets.only(top: 8),
          child: Text(
            'Vinit@mail.com',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
            ),
          ),
        )
      ]),
    );
  }
}