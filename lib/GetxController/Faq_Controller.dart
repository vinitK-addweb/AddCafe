import '../Utils/API.dart';
import 'package:get/get.dart';
import '../Models/Model_Faq.dart';

class FaqController extends GetxController {
  RxList<ModelFaq> faqData = <ModelFaq>[].obs;
  final currentid = 0.obs;

  initMethod() {
    Future.delayed(const Duration(milliseconds: 1), () {
      fetchFaqData();
    });
  }

// ---------------- Call faq Api to get data --------------------->
  Future fetchFaqData() async {
    final response =
        await API.instance.get(endPoint: 'about/faq/', isHeader: false);

    faqData.value =
        List<ModelFaq>.from(response.map((x) => ModelFaq.fromJson(x)));
  }
}
