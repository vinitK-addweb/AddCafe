import 'package:addcafe/Utils/API.dart';
import 'package:get/get.dart';

class ViewMoreController extends GetxController{

  RxList menuCategory = [
    {'category':'Italian'}, {'category':'Chinese'},{'category':'Indian'},{'category':'North Indian'},
 ].obs;
  RxList cuisineData = [].obs;
RxList cuisineFilter = [].obs;
  RxInt currentIndex = 0.obs;

  initFunction() {

    Future.delayed(Duration(milliseconds: 200),(){getCuisine();
      if(cuisineFilter.isEmpty)
    getCuisineFilter(0);
    // print(cuisineData);
    });

  }

  getCuisine()async{
    cuisineData.value = await API.instance.get(endPoint: "catalogue/active-cuisine/", isHeader: true);

    update();
    // print(cuisineData );

  }
  getCuisineFilter(index) async{

cuisineFilter.value = await API.instance.get(endPoint: "catalogue/active-category/?cuisine=${index}", isHeader: true);
update();
  print("filter============>>>"+cuisineFilter.toString());
  }
}