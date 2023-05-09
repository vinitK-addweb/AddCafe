import 'dart:developer';

import 'package:addcafe/Utils/API.dart';
import 'package:get/get.dart';

import '../Utils/Constant.dart';
import 'ViewMore_controller.dart';

class MenuItemsController extends GetxController{


 RxInt veg= 0.obs;
 RxInt lowToHigh= 0.obs;
 RxInt showItems = 0.obs;
 RxBool search = false.obs;
 RxList menuItems = [].obs;
 RxList menuCategory = [].obs;
 RxList products = [].obs;
 RxString cuisineId = "".obs;
 RxString categoryId = "".obs;
 bool isloader = true;
 late final viewMoreController;

  initFunction() {
    Future.delayed(Duration(milliseconds: 200), () {
      if(Get.isRegistered<ViewMoreController>() !=false){
        viewMoreController = Get.find<ViewMoreController>();
      }
      getMenuItems();
      getProducts(categoryId);
      getCategoryData(categoryId.value);
    });
  }
  getMenuItems() async{

      menuCategory = await viewMoreController.cuisineData;
      menuCategory.add({"id": "", "name": "All Menu"});
      // menuItems = await viewMoreController.cuisineFilter;
      update();

    }

    getCategoryData(idx)async{
      // menuItems.value = [];
viewMoreController. cuisineFilter.value = [];
 await viewMoreController.getCuisineFilter(idx);

 menuItems.value = await viewMoreController.cuisineFilter;
 log("menu itemsss==>>"+menuItems.toString());
 update();
    }

    getProducts(cat)async{
      var isVeg;
    if(veg.value==1){
      isVeg = true;
    }else if(veg.value==2){
      isVeg = false;
    }

      products.value = [];
      // isloader = true;
      products.value = await API.instance.get(endPoint: "catalogue/active-product/?din_in=$isSwitched&is_veg=$isVeg&category=$cat", isHeader: true);

      update();
      // isloader = false;

  }



}