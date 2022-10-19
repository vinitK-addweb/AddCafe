import 'package:flutter/material.dart';

class EmptyCart extends StatelessWidget {
  const EmptyCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Container(
          width: double.infinity,
          child: Image(
            image: AssetImage('assets/images/emptyCart.png'),
            fit: BoxFit.cover,
          ),
        ),
        Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(vertical: 20),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 5),
                  child: Text(
                    'Good food is always cooking !',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 5),
                  child: Text('Go ahead, order some yummy items',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                )
              ],
            ))
      ]),
    );
  }
}
