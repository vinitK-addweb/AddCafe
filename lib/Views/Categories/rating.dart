import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class Rating extends StatelessWidget {
  Rating(@required this.rating);

  final int rating;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(children: [
        ...List.generate(rating, (index) {
          return Icon(
            Icons.star,
            color: Colors.red,
          );
        }),
        ...List.generate(5 - rating, (index) {
          return Icon(
            Icons.star_border,
            color: Colors.red,
          );
        })
      ]),
    );
  }
}
