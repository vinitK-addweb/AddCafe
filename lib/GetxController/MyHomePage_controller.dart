import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomeBannerController extends GetxController {
  RxList homeBannerData = [].obs;

  initMethodGetX() {
    print("initMethodGetXinitMethodGetXinitMethodGetX");

    fetchHomeBanner();
  }

  Future fetchHomeBanner() async {
    http.Response response;
    response = await http
        .get(Uri.parse('https://kindly-opposite-wishbone.glitch.me/products'));
    if (response.statusCode == 200) {
      // setState(() {
      homeBannerData.value = json.decode(response.body);
      // });
      print('fetchHomeBanner called');
    } else {}
  }
}
