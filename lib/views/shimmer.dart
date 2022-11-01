import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class Myshimmer extends StatelessWidget {
  final double width;
  final double height;
  final ShapeBorder shapeBorder;

  const Myshimmer.rectangular({
    this.width = double.infinity,
    required this.height,
  }) : this.shapeBorder = const RoundedRectangleBorder();

  const Myshimmer.Circular(
      {this.width = double.infinity,
      required this.height,
      this.shapeBorder = const CircleBorder()});
  @override
  Widget build(BuildContext context) => Shimmer.fromColors(
      baseColor: Colors.grey[400]!,
      highlightColor: Colors.grey[300]!,
      child: Container(
        width: width,
        height: height,
        decoration: ShapeDecoration(color: Colors.grey, shape: shapeBorder),
      ));
}
