import '../Models/Model_MyHomePage.dart';
import '../Models/Model_Categories.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Views/Categories/categoryItems.dart';
import '../Models/Model_Banner.dart';
import '../Models/Model_Categories.dart';
import '../Styles/TextStyles.dart';
import '../Styles/ColorStyle.dart';
import '../GetxController/ActiveProducts_controller.dart';

class HomeCategory extends StatelessWidget {
  HomeCategory(this.categoriesImage, this.bannerData);
  // final List<ModelHomeCategory> CategoryImages;
  final List<ModelCategories> categoriesImage;
  final List<ModelBanner> bannerData;
  final ActiveProductsController productController =
      Get.put(ActiveProductsController());
  @override
  Widget build(BuildContext context) {
    // final controller = ActiveProductsController();
    // controller.fetchAllProducts();
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              margin: const EdgeInsets.only(left: 20),
              child: Text(
                'Explore Menu',
                style: TextStylesCustom.textStyles_20.apply(fontWeightDelta: 4),
              )),
          Center(
            child: Wrap(
                spacing: 10,
                children: categoriesImage.map((item) {
                  return Container(
                    margin: const EdgeInsets.all(10),
                    width: 100,
                    child: InkWell(
                      onTap: (() {
                        print("valueeeeeeeeeeeee before" +
                            productController.selectedCategory.value);
                        productController.selectedCategory.value = item.name!;
                        print("valueeeeeeeeeeeee" +
                            productController.selectedCategory.value);
                        Get.to(CategoryItems(
                            item.name!, bannerData, categoriesImage));
                      }),
                      child:
                          //  Card(
                          //   elevation: 0,
                          //   child:
                          Column(
                        children: [
                          CircleAvatar(
                            backgroundImage: NetworkImage(item.image!),
                            radius: 40,
                          ),
                          Container(
                              margin: const EdgeInsets.symmetric(vertical: 10),
                              child: Text(
                                item.name!,
                                style: TextStylesCustom.textStyles_12
                                    .apply(fontWeightDelta: 2),
                              ))
                        ],
                      ),
                      // ),
                    ),
                  );
                }).toList()),
          )
        ],
      ),
    );
  }
}
