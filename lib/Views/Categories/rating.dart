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
          return const Icon(
            Icons.star,
            color: Colors.red,
            size: 15,
          );
        }),
        ...List.generate(5 - rating, (index) {
          return const Icon(
            Icons.star_border,
            color: Colors.red,
            size: 15,
          );
        })
      ]),
    );
  }
}
