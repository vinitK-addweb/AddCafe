// ignore_for_file: prefer_const_constructors

import 'package:addcafe/Providers/apis/MyfavouritesApi.dart';
import 'package:flutter/material.dart';
import './category/CategoryDropdown.dart';
import 'package:provider/provider.dart';
import './HomeBanner.dart';
import '../widgets/category/rating.dart';
import 'package:addcafe/Providers/apis/MyfavouritesApi.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Myfavourits extends StatefulWidget {
  const Myfavourits({super.key});

  @override
  State<Myfavourits> createState() => _MyfavouritsState();
}

class _MyfavouritsState extends State<Myfavourits> {
  @override
  Widget build(BuildContext context) {
    // <--------------------Initialized the provider ------------------>
    final myFavourites = Provider.of<MyFavouritesApi>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Favourites',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ...myFavourites.myFavouritesData.map((e) {
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
                                image: AssetImage('assets/images/vegIcon.png'),
                                fit: BoxFit.fill,
                              )),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: Text(
                              // '${e.product_data['category_name']}',
                              '${e['product_data']['item_name']}',
                              // e['item_name'],
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
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
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text('Rs. ${e['product_data']['price']}'),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              // <----------- Remove from wishlist ----------------->
                              InkWell(
                                onTap: () {
                                  myFavourites.deleteMyFavourites(e['id']);
                                },
                                child: Container(
                                  margin: EdgeInsets.symmetric(vertical: 10),
                                  child: Text(
                                    'Remove',
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 3),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                              ),

                              // <------------- Share item ------------->
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 10),
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
                                  // <---------------- product Images ---------------------->
                                  width: 150,
                                  height: 150,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image(
                                      image: NetworkImage(
                                          '${dotenv.env['IMG_URL']}${e['product_data']['featured_image']}'),
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
                                      // if ((e['add_on_data'] as List)
                                      //     .isNotEmpty)
                                      // {
                                      //   showModalBottomSheet(
                                      //     isScrollControlled: true,
                                      //     backgroundColor:
                                      //         Colors.transparent,
                                      //     shape: RoundedRectangleBorder(
                                      //         borderRadius:
                                      //             BorderRadius.vertical(
                                      //                 top:
                                      //                     Radius.circular(
                                      //                         20))),
                                      //     context: context,
                                      //     builder: (context) => Addon(e),
                                      //   )
                                      // }
                                    },
                                child: Text('Add')),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
