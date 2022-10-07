// ignore_for_file: prefer_const_constructors

import 'package:addcafe/Providers/apis/CategoriesApi.dart';
import 'package:flutter/material.dart';
import 'CategoryDropdown.dart';
import 'package:provider/provider.dart';

class CategoryItems extends StatefulWidget {
  // CategoryItems({Key? key}) : super(key: key);
  CategoryItems(this.currentCategory);

  final String currentCategory;

  @override
  State<CategoryItems> createState() => _CategoryItemsState(currentCategory);
}

class _CategoryItemsState extends State<CategoryItems> {
  _CategoryItemsState(this.currentCategory);
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
          ...categoriesData.categoriesData.map((e) {
            return InkWell(
                onTap: () {
                  changeCategory(e['categoryName']);
                },
                child: Card(
                  child: Column(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${e['categoryName']}(${e['categoryItems'].length})',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        IconButton(
                            onPressed: () {
                              changeCategory(e['categoryName']);
                            },
                            icon: Icon(currentCategory == e['categoryName']
                                ? Icons.arrow_drop_up
                                : Icons.arrow_drop_down))
                      ],
                    ),
                    currentCategory == e['categoryName']
                        ? CategoryDropdown(e['categoryItems'])
                        : SizedBox(
                            height: 0,
                          ),
                  ]),
                ));
          }).toList()
        ]),
      ),
    );
  }
}
