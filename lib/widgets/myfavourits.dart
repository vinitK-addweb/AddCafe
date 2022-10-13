// ignore_for_file: prefer_const_constructors

import 'package:addcafe/Providers/apis/CategoriesApi.dart';
import 'package:addcafe/Providers/apis/HomeBannerApi.dart';
import 'package:addcafe/Providers/apis/HomeCategoryApi.dart';
import 'package:flutter/material.dart';
import './category/CategoryDropdown.dart';
import 'package:provider/provider.dart';
import './HomeBanner.dart';

class Myfavourits extends StatefulWidget {
  // Myfavourits({Key? key}) : super(key: key);
  Myfavourits(this.currentCategory);

  final String currentCategory;

  @override
  State<Myfavourits> createState() => _MyfavouritsState(currentCategory);
}

class _MyfavouritsState extends State<Myfavourits> {
  _MyfavouritsState(this.currentCategory);
  String currentCategory;
  changeCategory(String category) {
    if (currentCategory == category) {
      setState(() {
        currentCategory = '';
      });
    } else {
      setState(() {
        currentCategory = category;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final categoriesData = Provider.of<CategoriesApi>(context);
    final homeCategoryApi = Provider.of<HomeCategoryApi>(context);
    final homeBannerApi = Provider.of<HomeBannerApi>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(
            height: 60,
          ),
          IconButton(
            style: ElevatedButton.styleFrom(
                shape: StadiumBorder(),
                backgroundColor: Colors.white,
                foregroundColor: Colors.black),
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios),
          ),
          HomeBanner(homeBannerApi.homeBannerData),
          ...homeCategoryApi.homeCategoryData.map((e) {
            categoriesData.getFilteredProducts(e['name']);
            // print(categoriesData.allProducts);
            return Card(
                child: Column(
              children: [
                InkWell(
                    onTap: () {
                      changeCategory(e['name']);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${e['name']}(${categoriesData.categoryProduct.length})',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        IconButton(
                            onPressed: () {
                              changeCategory(e['name']);
                            },
                            icon: Icon(currentCategory == e['name']
                                ? Icons.arrow_drop_up
                                : Icons.arrow_drop_down))
                      ],
                    )),
                currentCategory == e['name'] &&
                        categoriesData.categoryProduct.isNotEmpty
                    ? CategoryDropdown(categoriesData.categoryProduct)
                    : SizedBox(
                        height: 0,
                      ),
              ],
            ));
          }).toList()
        ]),
      ),
    );
  }
}
