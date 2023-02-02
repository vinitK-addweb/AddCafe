import 'package:get/get.dart';
import '../Styles/TextStyles.dart';
import '../Models/Model_Banner.dart';
import 'package:flutter/material.dart';
import '../Models/Model_Categories.dart';
import '../Views/Categories/categoryItems.dart';
import '../GetxController/ActiveProducts_controller.dart';

class HomeCategory extends StatelessWidget {
  HomeCategory(this.categoriesImage, this.bannerData);

  final List<ModelCategories> categoriesImage;
  final List<ModelBanner> bannerData;
  final ActiveProductsController productController =
      Get.put(ActiveProductsController());

  @override
  Widget build(BuildContext context) {
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
                        productController.slectCategory(item.name);
                        Future.delayed(const Duration(milliseconds: 10), () {
                          Get.to(CategoryItems(
                              item.name!, bannerData, categoriesImage));
                        });
                      }),
                      child: Column(
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
