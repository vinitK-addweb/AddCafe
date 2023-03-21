import '../Utils/API.dart';
import 'package:get/get.dart';
import '../Models/Model_PrivacyPolicy.dart';
import '../Models/Model_Terms&Conditions.dart';

class PrivacyPolicyController extends GetxController {
  RxList<PrivacyPolicy> privacyPolicy = <PrivacyPolicy>[].obs;
  RxList<TermsCondtionsModel> termsCondtions = <TermsCondtionsModel>[].obs;
  initfunction() {
    Future.delayed(const Duration(milliseconds: 1), () {
      fetchPrivacyPolicy();
      fetchTermsCondtions();
    });
  }

  fetchPrivacyPolicy() async {
    final response = await API.instance
        .get(endPoint: "about/privacyandpolicy/", isHeader: false);

    privacyPolicy.value = List<PrivacyPolicy>.from(
        response.map((x) => PrivacyPolicy.fromJson(x)));
  }

  fetchTermsCondtions() async {
    final response = await API.instance
        .get(endPoint: "about/termsandcondition/", isHeader: false);

    termsCondtions.value = List<TermsCondtionsModel>.from(
        response.map((x) => TermsCondtionsModel.fromJson(x)));
  }
}
