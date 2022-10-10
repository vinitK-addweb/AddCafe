import 'package:flutter/material.dart';
import 'package:addcafe/Providers/apis/UserAuth.dart';
import 'package:provider/provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class DrowerHeader extends StatefulWidget {
  @override
  State<DrowerHeader> createState() => _DrowerHeaderState();
}

class _DrowerHeaderState extends State<DrowerHeader> {
  @override
  Widget build(BuildContext context) {
    final userAuth = Provider.of<UserAuth>(context);
    return Container(
      margin: EdgeInsets.only(top: 35),
      width: double.infinity,
      height: 200,
      padding: EdgeInsets.only(top: 20.0),
      child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        CircleAvatar(
            radius: 55,
            backgroundImage: NetworkImage(
              userAuth.userData['payload']['email'] == null
                  ? 'https://mir-s3-cdn-cf.behance.net/user/276/462829507061295.5f9717443f152.png'
                  : '${dotenv.env['IMG_URL']}${userAuth.userData['payload']['profile_picture']}'
                      as String,
            )),
        Container(
          margin: EdgeInsets.only(top: 8),
          child: Text(
            // 'Vinit Singh'
            userAuth.userData['payload']['first_name'] == null
                ? ''
                : userAuth.userData['payload']['first_name'] as String,
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          // margin: EdgeInsets.only(top: 8),
          child: Text(
            userAuth.userData['payload']['email'] == null
                ? ''
                : userAuth.userData['payload']['email'] as String,
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
