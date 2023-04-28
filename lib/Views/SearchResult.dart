import 'package:get/get.dart';
import 'Categories/addons.dart';
import 'Categories/rating.dart';
import '../Styles/ColorStyle.dart';
import '../Styles/TextStyles.dart';
import 'package:flutter/material.dart';
import '../GetxController/Cart_controller.dart';
import '../GetxController/searchResult_controller.dart';

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
          :

      ListView.builder(
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

      ;
    });
  }
}
