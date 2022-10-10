import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'rating.dart';
import 'addons.dart';

class CategoryDropdown extends StatelessWidget {
  CategoryDropdown(this.categoryItems);

  final List categoryItems;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: categoryItems.isNotEmpty
            ? categoryItems.map((e) {
                if (e != null) {
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: Card(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  width: 20,
                                  child: Image(
                                    image:
                                        AssetImage('assets/images/vegIcon.png'),
                                    fit: BoxFit.fill,
                                  )),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.5,
                                child: Text(
                                  e['item_name'],
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Rating(3),
                                  Text(
                                    '345 reviews',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text('Rs. ${e['price']}'),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.favorite_border,
                                    color: Colors.red,
                                  ),
                                  Container(
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    child: Icon(
                                      Icons.share,
                                      color: Colors.blueAccent,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          Stack(
                            children: [
                              Container(
                                width: 150,
                                child: Column(
                                  children: [
                                    Container(
                                      width: 150,
                                      height: 150,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: Image(
                                          image:
                                              NetworkImage(e['featured_image']),
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    )
                                  ],
                                ),
                              ),
                              Positioned(
                                top: 120,
                                left: 45,
                                child: ElevatedButton(
                                    onPressed: () => {
                                          if ((e['add_on_data'] as List)
                                              .isNotEmpty)
                                            {
                                              showModalBottomSheet(
                                                isScrollControlled: true,
                                                backgroundColor:
                                                    Colors.transparent,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.vertical(
                                                            top:
                                                                Radius.circular(
                                                                    20))),
                                                context: context,
                                                builder: (context) => Addon(e),
                                              )
                                            }
                                        },
                                    child: Text('Add')),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                }
                return SizedBox(
                  height: 0,
                );
              }).toList()
            : [Text('no items')],
      ),
    );
  }
}
