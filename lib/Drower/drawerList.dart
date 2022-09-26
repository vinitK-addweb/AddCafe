import 'package:flutter/material.dart';

class MyDrowerList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(child: DrownerList());
  }
}

Widget DrownerList() {
  return Container(
    padding: EdgeInsets.only(top: 15),
    child: Column(
      children: [menuItem()],
    ),
  );
}

Widget menuItem() {
  return Material(
    child: InkWell(
      child: Padding(
        padding: EdgeInsets.all(15.0),
        child: Row(children: [
          Expanded(
            child: Icon(
              Icons.restaurant_menu_outlined,
              size: 20,
              color: Colors.black,
            ),
          ),
          Expanded(
            child: Text(
              'Menu',
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
          )
        ]),
      ),
    ),
  );
}
