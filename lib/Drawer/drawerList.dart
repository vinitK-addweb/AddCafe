import 'package:flutter/material.dart';

class MyDrowerList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(child: menuItem());
  }
}

Widget menuItem() {
  return Container(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    Card(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          child: Container(
            padding: EdgeInsets.all(10.0),
            child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Icon(
                Icons.restaurant_menu_outlined,
                size: 30,
                color: Colors.grey,
              ),
              Container(
                margin: EdgeInsets.only(left: 40),
                child: Text(
                  'Menu',
                  style: TextStyle(color: Colors.grey, fontSize: 20),
                ),
              ),
            ]),
          ),
        ),
        InkWell(
          child: Container(
            padding: EdgeInsets.all(10.0),
            child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              Icon(
                Icons.wallet_giftcard,
                size: 30,
                color: Colors.grey,
              ),
              Container(
                margin: EdgeInsets.only(left: 40),
                child: Text(
                  'Deals & Offers',
                  style: TextStyle(color: Colors.grey, fontSize: 20),
                ),
              ),
            ]),
          ),
        ),
        InkWell(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Row(children: [
              Icon(
                Icons.indeterminate_check_box_outlined,
                size: 30,
                color: Colors.grey,
              ),
              Container(
                margin: EdgeInsets.only(left: 40),
                child: Text(
                  'Every Value Offer',
                  style: TextStyle(color: Colors.grey, fontSize: 20),
                ),
              ),
            ]),
          ),
        ),
        InkWell(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Row(children: [
              Icon(
                Icons.train_sharp,
                size: 30,
                color: Colors.grey,
              ),
              Container(
                margin: EdgeInsets.only(left: 40),
                child: Text(
                  'Deliver On Train',
                  style: TextStyle(color: Colors.grey, fontSize: 20),
                ),
              ),
            ]),
          ),
        ),
      ],
    )),
    Card(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          child: Container(
            padding: EdgeInsets.all(10.0),
            child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Icon(
                Icons.map_sharp,
                size: 30,
                color: Colors.grey,
              ),
              Container(
                margin: EdgeInsets.only(left: 40),
                child: Text(
                  'Track Order',
                  style: TextStyle(color: Colors.grey, fontSize: 20),
                ),
              ),
            ]),
          ),
        ),
        InkWell(
          child: Container(
            padding: EdgeInsets.all(10.0),
            child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              Icon(
                Icons.local_pizza_sharp,
                size: 30,
                color: Colors.grey,
              ),
              Container(
                margin: EdgeInsets.only(left: 40),
                child: Text(
                  'Order History',
                  style: TextStyle(color: Colors.grey, fontSize: 20),
                ),
              ),
            ]),
          ),
        ),
        InkWell(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Row(children: [
              Icon(
                Icons.wallet,
                size: 30,
                color: Colors.grey,
              ),
              Container(
                margin: EdgeInsets.only(left: 40),
                child: Text(
                  'Wallet',
                  style: TextStyle(color: Colors.grey, fontSize: 20),
                ),
              ),
            ]),
          ),
        ),
        InkWell(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Row(children: [
              Icon(
                Icons.favorite_border_outlined,
                size: 30,
                color: Colors.grey,
              ),
              Container(
                margin: EdgeInsets.only(left: 40),
                child: Text(
                  'My Favourites',
                  style: TextStyle(color: Colors.grey, fontSize: 20),
                ),
              ),
            ]),
          ),
        ),
      ],
    )),
    Card(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          child: Container(
            padding: EdgeInsets.all(10.0),
            child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Icon(
                Icons.language_sharp,
                size: 30,
                color: Colors.grey,
              ),
              Container(
                margin: EdgeInsets.only(left: 40),
                child: Text(
                  'Change Language',
                  style: TextStyle(color: Colors.grey, fontSize: 20),
                ),
              ),
            ]),
          ),
        ),
        InkWell(
          child: Container(
            padding: EdgeInsets.all(10.0),
            child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              Icon(
                Icons.feedback,
                size: 30,
                color: Colors.grey,
              ),
              Container(
                margin: EdgeInsets.only(left: 40),
                child: Text(
                  'Feedback',
                  style: TextStyle(color: Colors.grey, fontSize: 20),
                ),
              ),
            ]),
          ),
        ),
        InkWell(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Row(children: [
              Icon(
                Icons.feed_sharp,
                size: 30,
                color: Colors.grey,
              ),
              Container(
                margin: EdgeInsets.only(left: 40),
                child: Text(
                  'Terms & Conditions',
                  style: TextStyle(color: Colors.grey, fontSize: 20),
                ),
              ),
            ]),
          ),
        ),
        InkWell(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Row(children: [
              Icon(
                Icons.headphones,
                size: 30,
                color: Colors.grey,
              ),
              Container(
                margin: EdgeInsets.only(left: 40),
                child: Text(
                  'Contact Us',
                  style: TextStyle(color: Colors.grey, fontSize: 20),
                ),
              ),
            ]),
          ),
        ),
      ],
    )),
  ]));
}
