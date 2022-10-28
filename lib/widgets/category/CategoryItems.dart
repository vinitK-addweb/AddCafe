// ignore_for_file: prefer_const_constructors

import 'package:addcafe/Providers/apis/CategoriesApi.dart';
import 'package:addcafe/Providers/apis/HomeBannerApi.dart';
import 'package:addcafe/Providers/apis/HomeCategoryApi.dart';
import 'package:addcafe/Providers/apis/CartApi.dart';
import 'package:flutter/material.dart';
import 'CategoryDropdown.dart';
import 'package:provider/provider.dart';
import '../HomeBanner.dart';

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
    final homeCategoryApi = Provider.of<HomeCategoryApi>(context);
    final homeBannerApi = Provider.of<HomeBannerApi>(context);
    final cartApi = Provider.of<CartApi>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories'),
        centerTitle: true,
      ),
      bottomNavigationBar: cartApi.cart['count'] > 0
          ? Container(
              height: MediaQuery.of(context).size.width / 5.4,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/cart');
                },
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${cartApi.cart['count']} ITEM',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          Text('Rs. ${cartApi.cart['total_rate']}',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18))
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Next  >',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 28))
                        ],
                      )
                    ]),
              ),
            )
          : SizedBox(
              height: 0,
            ),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
