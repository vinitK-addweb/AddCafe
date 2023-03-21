import 'dart:convert';
import '../Utils/API.dart';
import 'package:get/get.dart';
import '../Utils/Constant.dart';
import 'package:http/http.dart' as http;
import '../Models/Model_MyWishList.dart';

class MyFavouritesApi extends GetxController {
  RxList<Wishlist> myFavourites = <Wishlist>[].obs;

  initMethod() {
    Future.delayed(const Duration(milliseconds: 10), () {
      fetchMyFavourites();
    });
  }

  Future fetchMyFavourites() async {
    final wishlist = await API.instance
        .get(endPoint: APIEndPoints.instance.KWishlist, isHeader: true);

    myFavourites.value =
        List<Wishlist>.from(wishlist.map((x) => Wishlist.fromJson(x)));
  }

  Future deleteMyFavourites(id) async {
    await API.instance
        .delete(endPoint: 'catalogue/wishlist/$id/', isHeader: true);
    fetchMyFavourites();
    isInMyFavorites(id);
  }

  Future addToMyFavorites(productData) async {
    http.Response response;

    response = await http.post(Uri.parse('${kBaseUrl}catalogue/wishlist/'),
        headers: {
          "Content-Type": "application/json",
          "Authorization": 'Bearer $kTOKENSAVED'
        },
        body: jsonEncode(productData));

    if (response.statusCode == 200) {
      fetchMyFavourites();
    } else {}
  }

  List isInMyFavorites(productId) {
    var a =
        myFavourites.where((element) => element.product == productId).toList();

    return a;
  }
}
