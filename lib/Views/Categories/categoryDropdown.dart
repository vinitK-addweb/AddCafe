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
import '../../GetxController/ActiveProducts_controller.dart';
import '../../GetxController/Cart_controller.dart';
import '../../GetxController/Wishlist_controller.dart';
import 'rating.dart';
import 'addons.dart';
import '../../Models/Model_ActiveProducts.dart';

class CategoryDropdown extends StatelessWidget {
  CategoryDropdown(this.categoryItems);
  final conroller = Get.put(ActiveProductsController());

  List categoryItems = ActiveProductsController().categoryProduct;

  // final List<ModelActiveProducts> categoryItems;
  final cartApi = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    // print('category##%#%#${categoryItems}');
    final myFavouritesApi = Get.put(MyFavouritesApi());

    // final cartApi = Provider.of<CartApi>(context);
    // final myFavouritesApi = Provider.of<MyFavouritesApi>(context);
    // Future.delayed(Duration(milliseconds: 10), () {});
    return categoryItems.isEmpty
        ? Text(
            ' No item found',
            style: TextStylesCustom.textStyles_15
                .apply(fontWeightDelta: 2, color: ColorStyle.primaryColorRed),
          )
        : ListView.builder(
            itemCount: categoryItems.length,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              List thisCartData = cartApi.isInCart(categoryItems[index]['id']);
              return Obx(() {
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
                              // Text(myFavouritesApi
                              //     .isInMyFavorites(categoryItems[index]['id'])
                              //     .toString()),
                              Row(
                                children: [
                                  // myFavouritesApi
                                  //         .isInMyFavorites(
                                  //             categoryItems[index]['id'])
                                  //         .isNotEmpty
                                  //     ? Text(myFavouritesApi
                                  //         .isInMyFavorites(
                                  //             categoryItems[index]['id'])[0]
                                  //         .id
                                  //         .toString())
                                  //     : Text("data"),
                                  // Text(
                                  //     "data ${cartApi.isInCart(categoryItems[index]['id'])}"),
                                  myFavouritesApi
                                          .isInMyFavorites(
                                              categoryItems[index]['id'])
                                          .isNotEmpty
                                      ? IconButton(
                                          onPressed: () {
                                            myFavouritesApi.deleteMyFavourites(
                                              //  categoryItems[index]['id']
                                              myFavouritesApi
                                                  .isInMyFavorites(
                                                      categoryItems[index]
                                                          ['id'])[0]
                                                  .id,
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
                                                  ['id']
                                            });
                                          },
                                          icon: const Icon(
                                            Icons.favorite_border,
                                            color: Colors.red,
                                          ),
                                        ),
                                  Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 10),
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
                                            '${categoryItems[index]['featured_image']}'),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  // Text(cartApi.cartData[index].itemCount
                                  //     .toString())
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
                                        if ((categoryItems[index]['add_on_data']
                                                as List)
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
                                              builder: (context) =>
                                                  Addon(categoryItems[index]),
                                            )
                                          }
                                        else
                                          {
                                            cartApi.addToCart({
                                              'item': categoryItems[index]
                                                  ['id'],
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
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                                              backgroundColor:
                                                  ColorStyle.primaryColorRed),
                                          // iconSize: 26,
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
                                            // Future.delayed(
                                            //     Duration(milliseconds: 0), () {
                                            cartApi.update();
                                            // categoryProductFilter();
                                            // });
                                          },
                                        ),

                                        //  Text(
                                        //   '-',
                                        //   style: TextStyle(
                                        //       color: Colors.white),
                                        // ),
                                        //       ),
                                        // ),

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
            });
  }
}
