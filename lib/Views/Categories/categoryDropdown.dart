import 'package:addcafe/Styles/TextStyles.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// import 'package:addcafe/Providers/apis/CartApi.dart';
// import 'package:addcafe/Providers/apis/MyfavouritesApi.dart';
// import 'package:provider/provider.dart';
import 'rating.dart';
import 'addons.dart';
import '../../Models/Model_ActiveProducts.dart';

class CategoryDropdown extends StatelessWidget {
  CategoryDropdown(this.categoryItems);

  final List<ModelActiveProducts> categoryItems;

  @override
  Widget build(BuildContext context) {
    print('category##%#%#${categoryItems}');
    // final cartApi = Provider.of<CartApi>(context);
    // final myFavouritesApi = Provider.of<MyFavouritesApi>(context);
    return Container(
      child: Column(
        children: categoryItems.isNotEmpty
            ? categoryItems.map((e) {
                if (e != null) {
                  // List thisCartData = cartApi.isInCart(e['id']);
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
                                  '${e.itemName}',
                                  style: TextStylesCustom.textStyles_18
                                      .apply(fontWeightDelta: 3),
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
                                    style: TextStylesCustom.textStyles_15
                                        .apply(fontWeightDelta: 2),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text('₹ ${e.price}',
                                  style: TextStylesCustom.textStyles_16),
                              SizedBox(
                                height: 10,
                              ),
                              // Row(
                              //   children: [
                              //     myFavouritesApi
                              //             .isInMyFavorites(e['id'])
                              //             .isNotEmpty
                              //         ? IconButton(
                              //             onPressed: () {
                              //               myFavouritesApi.deleteMyFavourites(
                              //                   myFavouritesApi.isInMyFavorites(
                              //                       e['id'])[0]['id'],
                              //                   context);
                              //             },
                              //             icon: Icon(
                              //               Icons.favorite,
                              //               color: Colors.red,
                              //             ),
                              //           )
                              //         : IconButton(
                              //             onPressed: () {
                              //               myFavouritesApi.addToMyFavorites(
                              //                   {"user": 1, "product": e['id']},
                              //                   context);
                              //             },
                              //             icon: Icon(
                              //               Icons.favorite_border,
                              //               color: Colors.red,
                              //             ),
                              //           ),
                              //     Container(
                              //       margin:
                              //           EdgeInsets.symmetric(horizontal: 10),
                              //       child: Icon(
                              //         Icons.share,
                              //         color: Colors.blueAccent,
                              //       ),
                              //     ),
                              //   ],
                              // )
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
                                          image: NetworkImage(
                                              '${e.featuredImage}'),
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
                                child:
                                    // thisCartData.isEmpty
                                    // ? ElevatedButton(
                                    //     onPressed: () => {
                                    //       if ((e['add_on_data'] as List)
                                    //           .isNotEmpty)
                                    //         {
                                    //           showModalBottomSheet(
                                    //             isScrollControlled: true,
                                    //             backgroundColor:
                                    //                 Colors.transparent,
                                    //             shape: RoundedRectangleBorder(
                                    //                 borderRadius:
                                    //                     BorderRadius.vertical(
                                    //                         top:
                                    //                             Radius.circular(
                                    //                                 20))),
                                    //             context: context,
                                    //             builder: (context) => Addon(e),
                                    //           )
                                    //         }
                                    //       else
                                    //         {
                                    //           cartApi.addToCart({
                                    //             'item': e['id'],
                                    //             "addon": []
                                    //           })
                                    //         }
                                    //     },
                                    //     child: Text('Add'),
                                    //   )
                                    // :
                                    Container(
                                  width: 70,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 8),
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      border: Border.all(color: Colors.red),
                                      borderRadius: BorderRadius.all(
                                          (Radius.circular(4)))),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          // if (e['item_count'] == 1) {
                                          //   cartApi.delete(e['id']);
                                          //   return;
                                          // }
                                          // cartApi.updateQuantity('minus',
                                          //     thisCartData[0]['id']);
                                        },
                                        child: Container(
                                          width: 20,
                                          child: Center(
                                            child: Text(
                                              '-',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      ),
                                      // Text(
                                      //     '${thisCartData[0]['item_count']}',
                                      //     style: TextStyle(
                                      //         color: Colors.white)),
                                      InkWell(
                                        onTap: () {
                                          // cartApi.updateQuantity('plus',
                                          //     thisCartData[0]['id']);
                                        },
                                        child: Container(
                                          width: 20,
                                          child: Center(
                                            child: Text(
                                              '+',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
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
