import 'package:addcafe/Styles/ColorStyle.dart';
import 'package:addcafe/Styles/TextStyles.dart';
import 'package:addcafe/Utils/Constant.dart';
import 'package:addcafe/Views/Auth/Signin.dart';
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
import '../../Utils/Global.dart';
import 'rating.dart';
import 'addons.dart';
import '../../Models/Model_ActiveProducts.dart';

class CategoryDropdown extends StatelessWidget {
  CategoryDropdown({super.key});

  final controller = Get.put(ActiveProductsController());

  final cartApi = Get.put(CartController());
  final myFavouritesApi = Get.put(MyFavouritesApi());

  @override
  Widget build(BuildContext context) {
    if (controller.isloader) {
      return spinkitLoader();
    } else {
      if (controller.categoryProduct.isEmpty) {
        return Text(
          ' No item found ',
          style: TextStylesCustom.textStyles_15
              .apply(fontWeightDelta: 2, color: ColorStyle.primaryColorRed),
        );
      } else {
        return Obx(() {
          return ListView.builder(
              itemCount: controller.categoryProduct.length,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                List thisCartData =
                    cartApi.isInCart(controller.categoryProduct[index]['id']);

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
                                  '${controller.categoryProduct[index]['item_name']}',
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
                              Text(
                                  '₹ ${controller.categoryProduct[index]['price']}',
                                  style: TextStylesCustom.textStyles_16),
                              const SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.5,
                                child: Text(
                                  '${controller.categoryProduct[index]['description']}',
                                  style: TextStylesCustom.textStyles_10,
                                ),
                              ),
                              Obx(() {
                                return Row(
                                  children: [
                                    myFavouritesApi
                                            .isInMyFavorites(controller
                                                .categoryProduct[index]['id'])
                                            .isNotEmpty
                                        ? IconButton(
                                            onPressed: () {
                                              if (kTOKENSAVED != '') {
                                                myFavouritesApi
                                                    .deleteMyFavourites(
                                                  myFavouritesApi
                                                      .isInMyFavorites(controller
                                                              .categoryProduct[
                                                          index]['id'])[0]
                                                      .id,
                                                );
                                              } else {
                                                Get.to(() => Mylogin());
                                              }
                                            },
                                            icon: const Icon(
                                              Icons.favorite,
                                              color: Colors.red,
                                            ),
                                          )
                                        : IconButton(
                                            onPressed: () {
                                              if (kTOKENSAVED != '') {
                                                myFavouritesApi
                                                    .addToMyFavorites({
                                                  "user": 1,
                                                  "product": controller
                                                          .categoryProduct[
                                                      index]['id']
                                                });
                                              } else {
                                                Get.to(() => Mylogin());
                                              }
                                            },
                                            icon: const Icon(
                                              Icons.favorite_border,
                                              color: Colors.red,
                                            ),
                                          ),
                                  ],
                                );
                              })
                            ],
                          ),
                        ),
                        Stack(
                          children: [
                            SizedBox(
                              width: 150,
                              child: Column(
                                children: [
                                  SizedBox(
                                    width: 150,
                                    height: 150,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: Image(
                                        image: NetworkImage(
                                            '${controller.categoryProduct[index]['featured_image']}'),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
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
                                        if ((controller.categoryProduct[index]
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
                                                  controller
                                                      .categoryProduct[index]),
                                            )
                                          }
                                        else
                                          {
                                            if (kTOKENSAVED != '')
                                              {
                                                cartApi.addToCart({
                                                  'item': controller
                                                          .categoryProduct[
                                                      index]['id'],
                                                  "addon": []
                                                })
                                              }
                                            else
                                              {Get.to(() => Mylogin())}
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
  }
}
