import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../GetxController/Cart_controller.dart';
import '../GetxController/searchResult_controller.dart';
import '../Styles/ColorStyle.dart';
import '../Styles/TextStyles.dart';
import 'Categories/addons.dart';
import 'Categories/rating.dart';

class SearchResult extends StatelessWidget {
  SearchResult({super.key});
  final searchController = Get.put(SearchResultController());
  final cartApi = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return searchController.searchResult.isEmpty &&
              searchController.itemName.value.text.isNotEmpty
          ? Text(
              "No Result Found",
              style: TextStylesCustom.textStyles_20,
            )
          : ListView.builder(
              itemCount: searchController.searchResult.length,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                List thisCartData = cartApi
                    .isInCart(searchController.searchResult[index]['id']);
                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
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
                                    image:
                                        AssetImage('assets/images/vegIcon.png'),
                                    fit: BoxFit.fill,
                                  )),
                              const SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.5,
                                child: Text(
                                  '${searchController.searchResult[index]['item_name']}',
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
                              Text(
                                  '₹ ${searchController.searchResult[index]['price']}',
                                  style: TextStylesCustom.textStyles_16),
                              const SizedBox(
                                height: 10,
                              ),
                              // Text(myFavouritesApi
                              //     .isInMyFavorites(categoryItems[index]['id'])
                              //     .toString()),
                              // Row(
                              //   children: [
                              //     myFavouritesApi
                              //             .isInMyFavorites(
                              //                 categoryItems[index]['id'])
                              //             .isNotEmpty
                              //         ? IconButton(
                              //             onPressed: () {
                              //               myFavouritesApi.deleteMyFavourites(
                              //                   categoryItems[index]['id']
                              //                   // myFavouritesApi.isInMyFavorites(
                              //                   //         categoryItems[index]['id'])[0]
                              //                   //     ['id'],
                              //                   );
                              //             },
                              //             icon: const Icon(
                              //               Icons.favorite,
                              //               color: Colors.red,
                              //             ),
                              //           )
                              //         : IconButton(
                              //             onPressed: () {
                              //               myFavouritesApi.addToMyFavorites({
                              //                 "user": 1,
                              //                 "product": categoryItems[index]['id']
                              //               });
                              //             },
                              //             icon: const Icon(
                              //               Icons.favorite_border,
                              //               color: Colors.red,
                              //             ),
                              //           ),
                              //     Container(
                              //       margin:
                              //           const EdgeInsets.symmetric(horizontal: 10),
                              //       child: const Icon(
                              //         Icons.share,
                              //         color: Colors.blueAccent,
                              //       ),
                              //     ),
                              //   ],
                              // )
                            ],
                          ),
                        ),
                        Stack(
                          children: [
                            SizedBox(
                              width: 150,
                              child: Column(
                                // mainAxisAlignment: MainAxisAlignment.center,
                                // crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 150,
                                    height: 150,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: Image(
                                        image: NetworkImage(
                                            '${searchController.searchResult[index]['featured_image']}'),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  )
                                ],
                              ),
                            ),
                            Positioned(
                              top: 120,
                              left: 0,
                              right: 0,
                              child: thisCartData.isEmpty
                                  ? ElevatedButton(
                                      onPressed: () => {
                                        if ((searchController
                                                    .searchResult[index]
                                                ['add_on_data'] as List)
                                            .isNotEmpty)
                                          {
                                            showModalBottomSheet(
                                              isScrollControlled: true,
                                              backgroundColor:
                                                  Colors.transparent,
                                              shape:
                                                  const RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.vertical(
                                                              top: Radius
                                                                  .circular(
                                                                      20))),
                                              context: context,
                                              builder: (context) => Addon(
                                                  searchController
                                                      .searchResult[index]),
                                            )
                                          }
                                        else
                                          {
                                            cartApi.addToCart({
                                              'item': searchController
                                                  .searchResult[index]['id'],
                                              "addon": []
                                            })
                                          }
                                      },
                                      child: Text('Add'),
                                    )
                                  :
                                  //  Container(
                                  //     height: 50,
                                  //     width: 70,
                                  //     padding: EdgeInsets.symmetric(
                                  //         horizontal: 8, vertical: 8),
                                  //     decoration: BoxDecoration(
                                  //         color: Colors.red,
                                  //         border: Border.all(color: Colors.red),
                                  //         borderRadius:
                                  //             BorderRadius.all((Radius.circular(4)))),
                                  //     child:
                                  // Row(
                                  //     mainAxisAlignment:
                                  //         MainAxisAlignment.center,
                                  //     children: [
                                  //       // if (e['item_count'] == 1) {
                                  //       //   cartApi.delete(e['id']);
                                  //       //   return;
                                  //       // }
                                  //       // cartApi.updateQuantity('minus',
                                  //       //     thisCartData[0]['id']);

                                  //       // child: Container(
                                  //       //   width: 20,
                                  //       // child: Center(

                                  //       IconButton(
                                  //         style: IconButton.styleFrom(
                                  //             backgroundColor:
                                  //                 ColorStyle.primaryColorRed),
                                  //         // iconSize: 26,
                                  //         color: Colors.white,
                                  //         icon: const CircleAvatar(
                                  //             radius: 14,
                                  //             child: Icon(
                                  //               Icons.remove,
                                  //               size: 20,
                                  //             )),
                                  //         onPressed: () {},
                                  //       ),

                                  //       //  Text(
                                  //       //   '-',
                                  //       //   style: TextStyle(
                                  //       //       color: Colors.white),
                                  //       // ),
                                  //       //       ),
                                  //       // ),

                                  //       Text(
                                  //           // '${thisCartData[0]['item_count']}',
                                  //           '2',
                                  //           style: TextStylesCustom
                                  //               .textStyles_22
                                  //               .apply(
                                  //                   color: ColorStyle
                                  //                       .secondryColorBlack,
                                  //                   fontWeightDelta: 4)),
                                  //       IconButton(
                                  //         style: IconButton.styleFrom(
                                  //             backgroundColor:
                                  //                 ColorStyle.primaryColorRed),
                                  //         // iconSize: 26,
                                  //         color: Colors.white,
                                  //         icon: const CircleAvatar(
                                  //             radius: 14,
                                  //             child: Icon(
                                  //               Icons.add,
                                  //               size: 20,
                                  //             )),
                                  //         onPressed: () {},
                                  //       ),
                                  //       // InkWell(
                                  //       //     onTap: () {
                                  //       //       // cartApi.updateQuantity('plus',
                                  //       //       //     thisCartData[0]['id']);
                                  //       //     },
                                  //       //     // child: Container(
                                  //       //     //   width: 20,
                                  //       //     //   child: Center(
                                  //       //     child: SizedBox(
                                  //       //       width: 20,
                                  //       //       child: IconButton(
                                  //       //         iconSize: 12,
                                  //       //         color: Colors.white,
                                  //       //         icon: Icon(Icons.add),
                                  //       //         onPressed: () {},
                                  //       //       ),
                                  //       //     )
                                  //       //     // Text(
                                  //       //     //   '+',
                                  //       //     //   style: TextStyle(
                                  //       //     //       color: Colors.white),
                                  //       //     // ),
                                  //       //     //       ),
                                  //       //     // ),
                                  //       //     ),
                                  //     ],
                                  //   ),
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        IconButton(
                                          style: IconButton.styleFrom(
                                              backgroundColor:
                                                  ColorStyle.primaryColorRed),
                                          color: Colors.white,
                                          icon: const CircleAvatar(
                                              radius: 14,
                                              child: Icon(
                                                Icons.remove,
                                                size: 20,
                                              )),
                                          onPressed: () {
                                            cartApi.updateQuantity(
                                                'minus', thisCartData[0].id);

                                            cartApi.update();
                                          },
                                        ),
                                        Text(
                                            thisCartData[0]
                                                .itemCount
                                                .toString(),
                                            style: TextStylesCustom
                                                .textStyles_22
                                                .apply(
                                                    color: ColorStyle
                                                        .secondryColorBlack,
                                                    fontWeightDelta: 4)),
                                        IconButton(
                                          style: IconButton.styleFrom(
                                              backgroundColor:
                                                  ColorStyle.primaryColorRed),
                                          // iconSize: 26,
                                          color: Colors.white,
                                          icon: const CircleAvatar(
                                              radius: 14,
                                              child: Icon(
                                                Icons.add,
                                                size: 20,
                                              )),
                                          onPressed: () {
                                            cartApi.updateQuantity(
                                                'plus', thisCartData[0].id);
                                            cartApi.update();
                                          },
                                        ),
                                      ],
                                    ),
                            ),
                            // ),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              });

      ;
    });
  }
}
