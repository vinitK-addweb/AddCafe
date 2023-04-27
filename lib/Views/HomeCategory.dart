import 'package:get/get.dart';
import '../Styles/TextStyles.dart';
import '../Models/Model_Banner.dart';
import 'package:flutter/material.dart';
import '../Models/Model_Categories.dart';
import '../Views/Categories/categoryItems.dart';
import '../GetxController/ActiveProducts_controller.dart';
import '../GetxController/MyHomePage_controller.dart';
import 'ViewMore.dart';

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
                children:[
                  ...List.generate(5, (index) => Container(
        margin: const EdgeInsets.all(10),
        width: 100,
        child:

        InkWell(
          onTap: (() {
            productController.slectCategory(categoriesImage[index].name);
            Future.delayed(const Duration(milliseconds: 10), () {
              Get.to(CategoryItems(
              categoriesImage[index].name!, bannerData, categoriesImage));
            });
          }),
          child: Column(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(categoriesImage[index].image!),
                radius: 40,
              ),
              Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
    categoriesImage[index].name!,
                    style: TextStylesCustom.textStyles_12
                        .apply(fontWeightDelta: 2),
                  ))
            ],
          ),
          // ),
        ),
      ),),
                  InkWell(
                    onTap: ((){
                      Get.to(ViewMore());
                      // if(Get.isRegistered<HomeBannerController>() !=false){
                      //   Get.find<HomeBannerController>().currentIndex.value =4;
                      // }
                      // homPageController.currentIndex.value = 0;
                    }),
                    // onTap: (() {
                    //   productController.slectCategory(categoriesImage[index].name);
                    //   Future.delayed(const Duration(milliseconds: 10), () {
                    //     Get.to(CategoryItems(
                    //         categoriesImage[index].name!, bannerData, categoriesImage));
                    //   });
                    // }),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          CircleAvatar(
                            backgroundImage: NetworkImage(categoriesImage[0].image!),
                            radius: 40,
                          ),
                          Container(
                              margin: const EdgeInsets.symmetric(vertical: 10),
                              child: Text(
                                "View More",
                                style: TextStylesCustom.textStyles_12
                                    .apply(fontWeightDelta: 2),
                              ))
                        ],
                      ),
                    ),
                    // ),
                  ),
                ]


    ),
          )
        ],
      ),
    );
  }
}
