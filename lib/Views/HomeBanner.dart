import '../Models/Model_MyHomePage.dart';
import '../Models/Model_Banner.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../GetxController/MyHomePage_controller.dart';
import 'package:get/get.dart';

class HomeBanner extends StatelessWidget {
  final List<ModelBanner> bannerData;

  HomeBanner(this.bannerData);

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.symmetric(vertical: 20),
      child: CarouselSlider(
        options: CarouselOptions(
          height: 150.0, autoPlay: true,
          // enlargeCenterPage: true,
        ),
        items: bannerData.map((i) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(i.image!), fit: BoxFit.contain),
                    borderRadius: BorderRadius.circular(5.0)),
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 5.0),
              );
            },
          );
        }).toList(),
      ),
    );
  }
}
