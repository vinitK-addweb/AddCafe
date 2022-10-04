import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class HomeCategory extends StatelessWidget {
  HomeCategory(this.CategoryImages);
  final List CategoryImages;

  // final List CategoryImages = <Map>[
  //   {'imageName': 'cat_burger.jpg', 'imageText': 'Burger'},
  //   {'imageName': 'cat_cake.jpg', 'imageText': 'Cake'},
  //   {'imageName': 'cat_drinks.jpg', 'imageText': 'Drinks'},
  //   {'imageName': 'cat_pizza.jpg', 'imageText': 'Pizza'},
  //   {'imageName': 'cat_waffles.jpg', 'imageText': 'Waffles'},
  //   {'imageName': 'cat_icecream.jpg', 'imageText': 'Icecream'}
  // ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              margin: EdgeInsets.only(left: 20),
              child: Text(
                'Explore Menu',
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
          Center(
            child: Wrap(
                spacing: 10,
                children: (CategoryImages as List).map((item) {
                  return Container(
                    margin: EdgeInsets.all(10),
                    width: 100,
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/category',
                            arguments: item['name']);
                      },
                      child: Card(
                        elevation: 0,
                        child: Column(
                          children: [
                            CircleAvatar(
                              backgroundImage: NetworkImage(item['image']),
                              radius: 40,
                            ),
                            Container(
                                margin: EdgeInsets.symmetric(vertical: 10),
                                child: Text(
                                  item['name'],
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ))
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList()),
          )
        ],
      ),
    );
  }
}
