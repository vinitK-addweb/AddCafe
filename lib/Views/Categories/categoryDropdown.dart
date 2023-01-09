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
  CategoryDropdown(this.categoryItems, {super.key});
  final conroller = Get.put(ActiveProductsController());

  List categoryItems = ActiveProductsController().categoryProduct;

  // final List<ModelActiveProducts> categoryItems;
  final cartApi = Get.put(CartController());
  final myFavouritesApi = Get.put(MyFavouritesApi());
  @override
  Widget build(BuildContext context) {
    // print('category##%#%#${categoryItems}');

    // final cartApi = Provider.of<CartApi>(context);
    // final myFavouritesApi = Provider.of<MyFavouritesApi>(context);
    // Future.delayed(Duration(milliseconds: 10), () {});
    return Obx(() {
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
                List thisCartData =
                    cartApi.isInCart(categoryItems[index]['id']);
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
                                      image: AssetImage(
                                          'assets/images/vegIcon.png'),
                                      fit: BoxFit.fill,
                                    )),
                                const SizedBox(
                                  height: 10,
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.5,
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
                                      '(345)',
                                      style: TextStylesCustom.textStyles_13
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
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.5,
                                  child: Text(
                                    '${categoryItems[index]['description']}',
                                    style: TextStylesCustom.textStyles_10,
                                  ),
                                ),
                                // Text(myFavouritesApi
                                //     .isInMyFavorites(categoryItems[index]['id'])
                                //     .toString()),
                                Row(
                                  children: [
                                    myFavouritesApi
                                            .isInMyFavorites(
                                                categoryItems[index]['id'])
                                            .isNotEmpty
                                        ? IconButton(
                                            onPressed: () {
                                              myFavouritesApi
                                                  .deleteMyFavourites(
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
                                                //  cartApi.update();
                                              });
                                              // Future.delayed(
                                              //     Duration(milliseconds: 10), () {
                                              //   myFavouritesApi.update();
                                              // });
                                              // myFavouritesApi.update();
                                              // cartApi.update();
                                            },
                                            icon: const Icon(
                                              Icons.favorite_border,
                                              color: Colors.red,
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
                                    // Text(categoryItems[index]
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
                                          if ((categoryItems[index]
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
                                        child: const Text('Add'),
                                      )
                                    : Row(
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
              });
    });
  }
}
