import 'shimmer.dart';
import 'package:flutter/material.dart';

class MyLoader extends StatelessWidget {
  const MyLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return buildFoodShimmer();
  }

  Widget buildFoodShimmer() => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children:  [
          ListTile(
            title: Myshimmer.rectangular(height: 60),
          ),
          // ListTile(
          //   title: Myshimmer.rectangular(height: 150),
          // ),

          ListTile(
            title: Myshimmer.rectangular(height: 150),
          ),
          SizedBox(height: 30,),
          Row(children: [
            SizedBox(width: 20,),
            Myshimmer.Circular(
              height: 74,
              width: 74,
            ),SizedBox(width: 20,),
            Myshimmer.Circular(
              height: 74,
              width: 74,
            ),
            SizedBox(width: 10,),
            Myshimmer.Circular(
              height: 74,
              width: 74,
            ),SizedBox(width: 20,),
            Myshimmer.Circular(
              height: 74,
              width: 74,
            )
          ],),
          SizedBox(height: 30,),
          Row(children: [
            SizedBox(width: 20,),
            Myshimmer.Circular(
              height: 74,
              width: 74,
            ),SizedBox(width: 20,),
            Myshimmer.Circular(
              height: 74,
              width: 74,
            ),
            SizedBox(width: 10,),
            Myshimmer.Circular(
              height: 74,
              width: 74,
            ),SizedBox(width: 20,),
            Myshimmer.Circular(
              height: 74,
              width: 74,
            )
          ],),
          SizedBox(height: 30,),
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
            title: Myshimmer.rectangular(height: 150),
          ),
        ],
      );
}
