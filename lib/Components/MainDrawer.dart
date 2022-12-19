import 'package:flutter/material.dart';

import '../Drawer/drawerHeader.dart';
import '../Drawer/drawerList.dart';
import '../Styles/ColorStyle.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: ColorStyle.primaryColorRed,
              ),
              child: Column(children: const [
                DrowerHeader(),
              ]),
            ),
            MyDrowerList(),
            // userAuth.userprofile.isNotEmpty
          ],
        ),
      ),
    );
  }
}
