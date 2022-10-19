// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';

class Appbar extends StatefulWidget {
  @override
  State<Appbar> createState() => _AppbarState();
}

class _AppbarState extends State<Appbar> {
  // const Appbar({super.key});
  @override
  Widget build(BuildContext context) => AppBar(
        elevation: 0,
        title: Image.asset(
          'assets/images/addweb.png', height: 100, width: 200,
          // ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications),
          )
        ],
      );
}
