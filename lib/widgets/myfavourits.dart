import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:addcafe/Providers/apis/CartApi.dart';
import 'package:addcafe/Providers/apis/MyfavouritesApi.dart';
import 'package:provider/provider.dart';
import 'package:addcafe/widgets/category/rating.dart';
import 'package:addcafe/widgets/category/addons.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Myfavourits extends StatelessWidget {
  // Myfavourits(this.categoryItems);

  // final List myfavourits;

  @override
  Widget build(BuildContext context) {
    final cartApi = Provider.of<CartApi>(context);
    final myFavouritesApi = Provider.of<MyFavouritesApi>(context);
    return Scaffold(
      appBar: AppBar(
          title: Text(
        'My Wishlist',
        style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
      )),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: myFavouritesApi.myFavouritesData.isNotEmpty
                ? myFavouritesApi.myFavouritesData.map((e) {
                    if (e != null) {
                      List thisCartData = cartApi.isInCart(e['product']);
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
                                        image: AssetImage(
                                            'assets/images/vegIcon.png'),
                                        fit: BoxFit.fill,
                                      )),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.5,
                                    child: Text(
                                      e['product_data']['item_name'],
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
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
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
                                          myFavouritesApi
                                              .deleteMyFavourites(e['id']);
                                        },
                                        child: Container(
                                          margin: EdgeInsets.symmetric(
                                              vertical: 10),
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
                                      // myFavouritesApi
                                      //         .isInMyFavorites(e['id'])
                                      //         .isNotEmpty
                                      //     ? IconButton(
                                      //         onPressed: () {
                                      //           myFavouritesApi
                                      //               .deleteMyFavourites(
                                      //                   myFavouritesApi
                                      //                           .isInMyFavorites(
                                      //                               e['id'])[0]
                                      //                       ['id']);
                                      //         },
                                      //         icon: Icon(
                                      //           Icons.favorite,
                                      //           color: Colors.red,
                                      //         ),
                                      //       )
                                      // : IconButton(
                                      //     onPressed: () {
                                      //       myFavouritesApi
                                      //           .addToMyFavorites({
                                      //         "user": 1,
                                      //         "product": e['id']
                                      //       });
                                      //     },
                                      //     icon: Icon(
                                      //       Icons.favorite_border,
                                      //       color: Colors.red,
                                      //     ),
                                      //   ),
                                      Container(
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 10),
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
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            child: Image(
                                              image: NetworkImage(
                                                  // '${dotenv.env['IMG_URL']}
                                                  '${dotenv.env['IMG_URL']}/${e["product_data"]["featured_image"]}'),
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
                                    child: thisCartData.isEmpty
                                        ? ElevatedButton(
                                            onPressed: () => {
                                              if ((e['product_data']
                                                      ['add_on_data'] as List)
                                                  .isNotEmpty)
                                                {
                                                  showModalBottomSheet(
                                                    isScrollControlled: true,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    shape: RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.vertical(
                                                                top: Radius
                                                                    .circular(
                                                                        20))),
                                                    context: context,
                                                    builder: (context) => Addon(
                                                        e['product_data']),
                                                  )
                                                }
                                              else
                                                {
                                                  cartApi.addToCart({
                                                    'item': e['product_data']
                                                        ['id'],
                                                    "addon": []
                                                  })
                                                }
                                            },
                                            child: Text('Add'),
                                          )
                                        : Container(
                                            width: 70,
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 8, vertical: 8),
                                            decoration: BoxDecoration(
                                                color: Colors.red,
                                                border: Border.all(
                                                    color: Colors.red),
                                                borderRadius: BorderRadius.all(
                                                    (Radius.circular(4)))),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                InkWell(
                                                  onTap: () {
                                                    if (e['item_count'] == 1) {
                                                      cartApi.delete(e['id']);
                                                      return;
                                                    }
                                                    cartApi.updateQuantity(
                                                        'minus',
                                                        thisCartData[0]['id']);
                                                  },
                                                  child: Container(
                                                    width: 20,
                                                    child: Center(
                                                      child: Text(
                                                        '-',
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                    '${thisCartData[0]['item_count']}',
                                                    style: TextStyle(
                                                        color: Colors.white)),
                                                InkWell(
                                                  onTap: () {
                                                    cartApi.updateQuantity(
                                                        'plus',
                                                        thisCartData[0]['id']);
                                                  },
                                                  child: Container(
                                                    width: 20,
                                                    child: Center(
                                                      child: Text(
                                                        '+',
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white),
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
        ),
      ),
    );
  }
}
