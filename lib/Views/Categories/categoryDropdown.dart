import 'package:addcafe/Styles/ColorStyle.dart';
import 'package:addcafe/Styles/TextStyles.dart';
import 'package:addcafe/Views/Categories/categoryItems.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
// import 'package:addcafe/Providers/apis/CartApi.dart';
// import 'package:addcafe/Providers/apis/MyfavouritesApi.dart';
// import 'package:provider/provider.dart';
import '../../GetxController/Wishlist_controller.dart';
import 'rating.dart';
import 'addons.dart';
import '../../Models/Model_ActiveProducts.dart';

class CategoryDropdown extends StatelessWidget {
  CategoryDropdown(this.categoryItems);

  final categoryItems;

  // final List<ModelActiveProducts> categoryItems;

  @override
  Widget build(BuildContext context) {
    // print('category##%#%#${categoryItems}');
    final myFavouritesApi = Get.put(MyFavouritesApi());
    // final cartApi = Provider.of<CartApi>(context);
    // final myFavouritesApi = Provider.of<MyFavouritesApi>(context);
    return ListView.builder(
        itemCount: categoryItems.length,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Card(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Text(categoryItems.toString()),
                        const SizedBox(
                            width: 20,
                            child: Image(
                              image: AssetImage('assets/images/vegIcon.png'),
                              fit: BoxFit.fill,
                            )),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: Text(
                            '${categoryItems[index]['item_name']}',
                            style: TextStylesCustom.textStyles_18
                                .apply(fontWeightDelta: 3),
                          ),
                        ),
                        const SizedBox(
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
                        const SizedBox(
                          height: 10,
                        ),
                        Text('₹ ${categoryItems[index]['price']}',
                            style: TextStylesCustom.textStyles_16),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            myFavouritesApi
                                    .isInMyFavorites(categoryItems[index]['id'])
                                    .isNotEmpty
                                ? IconButton(
                                    onPressed: () {
                                      myFavouritesApi.deleteMyFavourites(
                                        myFavouritesApi.isInMyFavorites(
                                                categoryItems[index]['id'])[0]
                                            ['id'],
                                      );
                                    },
                                    icon: const Icon(
                                      Icons.favorite,
                                      color: Colors.red,
                                    ),
                                  )
                                : IconButton(
                                    onPressed: () {
                                      myFavouritesApi.addToMyFavorites({
                                        "user": 1,
                                        "product": categoryItems[index]
                                            ['product']
                                      });
                                    },
                                    icon: const Icon(
                                      Icons.favorite_border,
                                      color: Colors.red,
                                    ),
                                  ),
                            Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: const Icon(
                                Icons.share,
                                color: Colors.blueAccent,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Stack(
                    children: [
                      Container(
                        width: 150,
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 150,
                              height: 150,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image(
                                  image: NetworkImage(
                                      '${categoryItems[index]['featured_image']}'),
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
                        left: 0,
                        right: 0,
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
                            //   Container(
                            // height: 50,
                            // width: 70,
                            // padding: EdgeInsets.symmetric(
                            //     horizontal: 8, vertical: 8),
                            // decoration: BoxDecoration(
                            //     color: Colors.red,
                            //     border: Border.all(color: Colors.red),
                            //     borderRadius: BorderRadius.all(
                            //         (Radius.circular(4)))),
                            // child:
                            Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // if (e['item_count'] == 1) {
                            //   cartApi.delete(e['id']);
                            //   return;
                            // }
                            // cartApi.updateQuantity('minus',
                            //     thisCartData[0]['id']);

                            // child: Container(
                            //   width: 20,
                            // child: Center(

                            IconButton(
                              style: IconButton.styleFrom(
                                  backgroundColor: ColorStyle.primaryColorRed),
                              // iconSize: 26,
                              color: Colors.white,
                              icon: CircleAvatar(
                                  radius: 14,
                                  child: Icon(
                                    Icons.remove,
                                    size: 20,
                                  )),
                              onPressed: () {},
                            ),

                            //  Text(
                            //   '-',
                            //   style: TextStyle(
                            //       color: Colors.white),
                            // ),
                            //       ),
                            // ),

                            Text(
                                // '${thisCartData[0]['item_count']}',
                                '2',
                                style: TextStylesCustom.textStyles_22.apply(
                                    color: ColorStyle.secondryColorBlack,
                                    fontWeightDelta: 4)),
                            IconButton(
                              style: IconButton.styleFrom(
                                  backgroundColor: ColorStyle.primaryColorRed),
                              // iconSize: 26,
                              color: Colors.white,
                              icon: CircleAvatar(
                                  radius: 14,
                                  child: Icon(
                                    Icons.add,
                                    size: 20,
                                  )),
                              onPressed: () {},
                            ),
                            // InkWell(
                            //     onTap: () {
                            //       // cartApi.updateQuantity('plus',
                            //       //     thisCartData[0]['id']);
                            //     },
                            //     // child: Container(
                            //     //   width: 20,
                            //     //   child: Center(
                            //     child: SizedBox(
                            //       width: 20,
                            //       child: IconButton(
                            //         iconSize: 12,
                            //         color: Colors.white,
                            //         icon: Icon(Icons.add),
                            //         onPressed: () {},
                            //       ),
                            //     )
                            //     // Text(
                            //     //   '+',
                            //     //   style: TextStyle(
                            //     //       color: Colors.white),
                            //     // ),
                            //     //       ),
                            //     // ),
                            //     ),
                          ],
                        ),
                        // ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        });
    // Column(
    //   children: categoryItems.isNotEmpty
    //       ? categoryItems.map((e) {
    //           if (e != null) {
    //             // List thisCartData = cartApi.isInCart(e['id']);
    //             return Container(
    //               margin: EdgeInsets.symmetric(vertical: 10),
    //               child: Card(
    //                 child: Row(
    //                   mainAxisAlignment: MainAxisAlignment.spaceAround,
    //                   children: [
    //                     Expanded(
    //                       child: Column(
    //                         crossAxisAlignment: CrossAxisAlignment.start,
    //                         children: [
    //                           Container(
    //                               width: 20,
    //                               child: Image(
    //                                 image: AssetImage(
    //                                     'assets/images/vegIcon.png'),
    //                                 fit: BoxFit.fill,
    //                               )),
    //                           SizedBox(
    //                             height: 10,
    //                           ),
    //                           Container(
    //                             width:
    //                                 MediaQuery.of(context).size.width * 0.5,
    //                             child: Text(
    //                               '${e.itemName}',
    //                               style: TextStylesCustom.textStyles_18
    //                                   .apply(fontWeightDelta: 3),
    //                             ),
    //                           ),
    //                           SizedBox(
    //                             height: 10,
    //                           ),
    //                           Row(
    //                             children: [
    //                               Rating(3),
    //                               Text(
    //                                 '345 reviews',
    //                                 style: TextStylesCustom.textStyles_15
    //                                     .apply(fontWeightDelta: 2),
    //                               ),
    //                             ],
    //                           ),
    //                           SizedBox(
    //                             height: 10,
    //                           ),
    //                           Text('₹ ${e.price}',
    //                               style: TextStylesCustom.textStyles_16),
    //                           SizedBox(
    //                             height: 10,
    //                           ),
    //                           // Row(
    //                           //   children: [
    //                           //     myFavouritesApi
    //                           //             .isInMyFavorites(e['id'])
    //                           //             .isNotEmpty
    //                           //         ? IconButton(
    //                           //             onPressed: () {
    //                           //               myFavouritesApi.deleteMyFavourites(
    //                           //                   myFavouritesApi.isInMyFavorites(
    //                           //                       e['id'])[0]['id'],
    //                           //                   context);
    //                           //             },
    //                           //             icon: Icon(
    //                           //               Icons.favorite,
    //                           //               color: Colors.red,
    //                           //             ),
    //                           //           )
    //                           //         : IconButton(
    //                           //             onPressed: () {
    //                           //               myFavouritesApi.addToMyFavorites(
    //                           //                   {"user": 1, "product": e['id']},
    //                           //                   context);
    //                           //             },
    //                           //             icon: Icon(
    //                           //               Icons.favorite_border,
    //                           //               color: Colors.red,
    //                           //             ),
    //                           //           ),
    //                           //     Container(
    //                           //       margin:
    //                           //           EdgeInsets.symmetric(horizontal: 10),
    //                           //       child: Icon(
    //                           //         Icons.share,
    //                           //         color: Colors.blueAccent,
    //                           //       ),
    //                           //     ),
    //                           //   ],
    //                           // )
    //                         ],
    //                       ),
    //                     ),
    //                     Stack(
    //                       children: [
    //                         Container(
    //                           width: 150,
    //                           child: Column(
    //                             // mainAxisAlignment: MainAxisAlignment.center,
    //                             // crossAxisAlignment: CrossAxisAlignment.center,
    //                             children: [
    //                               Container(
    //                                 width: 150,
    //                                 height: 150,
    //                                 child: ClipRRect(
    //                                   borderRadius: BorderRadius.circular(8),
    //                                   child: Image(
    //                                     image: NetworkImage(
    //                                         '${e.featuredImage}'),
    //                                     fit: BoxFit.fill,
    //                                   ),
    //                                 ),
    //                               ),
    //                               SizedBox(
    //                                 height: 20,
    //                               )
    //                             ],
    //                           ),
    //                         ),
    //                         Positioned(
    //                           top: 120,
    //                           left: 0,
    //                           right: 0,
    //                           child:
    //                               // thisCartData.isEmpty
    //                               // ? ElevatedButton(
    //                               //     onPressed: () => {
    //                               //       if ((e['add_on_data'] as List)
    //                               //           .isNotEmpty)
    //                               //         {
    //                               //           showModalBottomSheet(
    //                               //             isScrollControlled: true,
    //                               //             backgroundColor:
    //                               //                 Colors.transparent,
    //                               //             shape: RoundedRectangleBorder(
    //                               //                 borderRadius:
    //                               //                     BorderRadius.vertical(
    //                               //                         top:
    //                               //                             Radius.circular(
    //                               //                                 20))),
    //                               //             context: context,
    //                               //             builder: (context) => Addon(e),
    //                               //           )
    //                               //         }
    //                               //       else
    //                               //         {
    //                               //           cartApi.addToCart({
    //                               //             'item': e['id'],
    //                               //             "addon": []
    //                               //           })
    //                               //         }
    //                               //     },
    //                               //     child: Text('Add'),
    //                               //   )
    //                               // :
    //                               //   Container(
    //                               // height: 50,
    //                               // width: 70,
    //                               // padding: EdgeInsets.symmetric(
    //                               //     horizontal: 8, vertical: 8),
    //                               // decoration: BoxDecoration(
    //                               //     color: Colors.red,
    //                               //     border: Border.all(color: Colors.red),
    //                               //     borderRadius: BorderRadius.all(
    //                               //         (Radius.circular(4)))),
    //                               // child:
    //                               Row(
    //                             mainAxisAlignment: MainAxisAlignment.center,
    //                             children: [
    //                               // if (e['item_count'] == 1) {
    //                               //   cartApi.delete(e['id']);
    //                               //   return;
    //                               // }
    //                               // cartApi.updateQuantity('minus',
    //                               //     thisCartData[0]['id']);

    //                               // child: Container(
    //                               //   width: 20,
    //                               // child: Center(

    //                               IconButton(
    //                                 style: IconButton.styleFrom(
    //                                     backgroundColor:
    //                                         ColorStyle.primaryColorRed),
    //                                 // iconSize: 26,
    //                                 color: Colors.white,
    //                                 icon: CircleAvatar(
    //                                     radius: 14,
    //                                     child: Icon(
    //                                       Icons.remove,
    //                                       size: 20,
    //                                     )),
    //                                 onPressed: () {},
    //                               ),

    //                               //  Text(
    //                               //   '-',
    //                               //   style: TextStyle(
    //                               //       color: Colors.white),
    //                               // ),
    //                               //       ),
    //                               // ),

    //                               Text(
    //                                   // '${thisCartData[0]['item_count']}',
    //                                   '2',
    //                                   style: TextStylesCustom.textStyles_22
    //                                       .apply(
    //                                           color: ColorStyle
    //                                               .secondryColorBlack,
    //                                           fontWeightDelta: 4)),
    //                               IconButton(
    //                                 style: IconButton.styleFrom(
    //                                     backgroundColor:
    //                                         ColorStyle.primaryColorRed),
    //                                 // iconSize: 26,
    //                                 color: Colors.white,
    //                                 icon: CircleAvatar(
    //                                     radius: 14,
    //                                     child: Icon(
    //                                       Icons.add,
    //                                       size: 20,
    //                                     )),
    //                                 onPressed: () {},
    //                               ),
    //                               // InkWell(
    //                               //     onTap: () {
    //                               //       // cartApi.updateQuantity('plus',
    //                               //       //     thisCartData[0]['id']);
    //                               //     },
    //                               //     // child: Container(
    //                               //     //   width: 20,
    //                               //     //   child: Center(
    //                               //     child: SizedBox(
    //                               //       width: 20,
    //                               //       child: IconButton(
    //                               //         iconSize: 12,
    //                               //         color: Colors.white,
    //                               //         icon: Icon(Icons.add),
    //                               //         onPressed: () {},
    //                               //       ),
    //                               //     )
    //                               //     // Text(
    //                               //     //   '+',
    //                               //     //   style: TextStyle(
    //                               //     //       color: Colors.white),
    //                               //     // ),
    //                               //     //       ),
    //                               //     // ),
    //                               //     ),
    //                             ],
    //                           ),
    //                           // ),
    //                         ),
    //                       ],
    //                     )
    //                   ],
    //                 ),
    //               ),
    //             );
    //           }
    //           return SizedBox(
    //             height: 0,
    //           );
    //         }).toList()
    //       : [Text('no items')],
    // );
  }
}
