import 'package:flutter/material.dart';
import 'shimmer.dart';

class MyLoader extends StatelessWidget {
  const MyLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return buildFoodShimmer();
  }

  Widget buildFoodShimmer() => Column(
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ListTile(
            // leading: Myshimmer.Circular(
            //   height: 64,
            //   width: 64,
            // ),
            title: Myshimmer.rectangular(height: 60),
          ),
          ListTile(
            // leading: Myshimmer.Circular(
            //   height: 64,
            //   width: 64,
            // ),
            title: Myshimmer.rectangular(height: 150),
          ),
          ListTile(
            leading: Myshimmer.Circular(
              height: 74,
              width: 74,
            ),
            // title: Myshimmer.rectangular(height: 150),
          ),
          ListTile(
            leading: Myshimmer.Circular(
              height: 74,
              width: 74,
            ),
            title: Myshimmer.rectangular(
              height: 10,
              width: 10,
            ),
            subtitle: Myshimmer.rectangular(
              height: 5,
              width: 10,
            ),
          ),
          ListTile(
            // leading: Myshimmer.Circular(
            //   height: 64,
            //   width: 64,
            // ),
            title: Myshimmer.rectangular(height: 150),
          ),
          ListTile(
            leading: Myshimmer.Circular(
              height: 74,
              width: 74,
            ),
            title: Myshimmer.rectangular(
              height: 10,
              width: 10,
            ),
            subtitle: Myshimmer.rectangular(
              height: 5,
              width: 10,
            ),
          ),
          ListTile(
            // leading: Myshimmer.Circular(
            //   height: 64,
            //   width: 64,
            // ),
            title: Myshimmer.rectangular(height: 150),
          ),
          // Container(
          //   child: Row(
          //     children: [
          //       ListTile(
          //         leading: Myshimmer.Circular(
          //           height: 64,
          //           width: 64,
          //         ),
          //         // title: Myshimmer.Circular(height: 80),
          //       ),
          //       ListTile(
          //         leading: Myshimmer.Circular(
          //           height: 64,
          //           width: 64,
          //         ),
          //         // title: Myshimmer.Circular(height: 80),
          //       ),
          //       ListTile(
          //         leading: Myshimmer.Circular(
          //           height: 64,
          //           width: 64,
          //         ),
          //         // title: Myshimmer.Circular(height: 80),
          //       ),
          //     ],
          //   ),
          // ),
        ],
      );
}
