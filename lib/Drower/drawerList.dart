import 'package:flutter/material.dart';

class MyDrowerList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(child: menuItem());
  }
}

// Widget DrownerList() {
//   return Container(
//     padding: EdgeInsets.only(top: 15),
//     child: Column(
//       children: [menuItem()],
//     ),
//   );
// }

Widget menuItem() {
  return Container(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    Card(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          child: Container(
            padding: EdgeInsets.all(1.0),
            child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Icon(
                Icons.restaurant_menu_outlined,
                size: 30,
                color: Colors.grey,
              ),
              Text(
                'Menu',
                style: TextStyle(color: Colors.grey, fontSize: 20),
              ),
            ]),
          ),
        ),
        InkWell(
          child: Container(
            padding: EdgeInsets.all(1.0),
            child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              Icon(
                Icons.restaurant_menu_outlined,
                size: 30,
                color: Colors.grey,
              ),
              Text(
                'Deals & Offers',
                style: TextStyle(color: Colors.grey, fontSize: 20),
              ),
            ]),
          ),
        ),
        InkWell(
          child: Padding(
            padding: EdgeInsets.all(5.0),
            child: Row(children: [
              Icon(
                Icons.restaurant_menu_outlined,
                size: 30,
                color: Colors.grey,
              ),
              Text(
                'Every Value Offer',
                style: TextStyle(color: Colors.grey, fontSize: 20),
              ),
            ]),
          ),
        ),
      ],
    )),
  ]));
}
