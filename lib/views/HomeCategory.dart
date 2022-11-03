import '../Models/Model_MyHomePage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class HomeCategory extends StatelessWidget {
  HomeCategory(this.CategoryImages);
  final List<ModelHomeCategory> CategoryImages;

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
                children: CategoryImages.map((item) {
                  return Container(
                    margin: const EdgeInsets.all(10),
                    width: 100,
                    child: InkWell(
                      child: Card(
                        elevation: 0,
                        child: Column(
                          children: [
                            CircleAvatar(
                              backgroundImage: NetworkImage(item.image!),
                              radius: 40,
                            ),
                            Container(
                                margin:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: Text(
                                  item.name!,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
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
