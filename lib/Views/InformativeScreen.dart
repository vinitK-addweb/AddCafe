import 'package:addcafe/Components/AppBarStyle.dart';
import 'package:addcafe/Views/Aboutus.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import '../GetxController/InformativeScreen_controller.dart';
import 'package:get/get.dart';

import '../Styles/ColorStyle.dart';
import '../Styles/TextStyles.dart';
import 'Terms&Condtions.dart';

class InformativeScreen extends StatelessWidget {
  InformativeScreen({super.key});
  final controller = Get.put(InformativeController());
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: InformativeController(),
      initState: controller.initMethod(),
      builder: (_) {
        return Obx(() {
          return Scaffold(
              key: scaffoldKey,
              appBar: AppBarStyle(
                styleTitle: TextStylesCustom.textStyles_20,
                elevation: 0,
                title: 'Informative Screen',
                backgroundColor: ColorStyle.primaryColorRed,
                leading: IconButton(
                  onPressed: () => Get.back(),
                  icon: const Icon(
                    Icons.arrow_back,
                    size: 34,
                    color: Colors.white,
                  ),
                ),
              ),
              body: Container(
                  child: Column(children: [
                Wrap(
                  direction: Axis.horizontal,
                  spacing: 20,
                  children: [

                    // ),
                    ...List.generate(
                      controller.informativeData.length,
                      (index) => controller.informativeData.isNotEmpty
                          ? InkWell(
                              onTap: () {
                                controller.currentIndex.value =
                                    controller.informativeData[index]['screen'];
                                // controller.getCuisineFilter(
                                // controller.informativeData[index]['id']);
                              },
                              child: Container(
                                  height: 50,
                                  width: 80,
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                        width: 3.0,
                                        color: controller.currentIndex ==
                                                controller
                                                        .informativeData[index]
                                                    ['screen']
                                            ? Colors.greenAccent
                                            : Colors.transparent,
                                      ),
                                    ),
                                  ),
                                  child: Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        controller.informativeData[index]
                                            ['screen_value'],
                                        textAlign: TextAlign.center,
                                        style: TextStylesCustom.textStyles_14
                                            .apply(fontWeightDelta: 3),
                                      ))),
                            )
                          : Text(""),
                    )
                    // )
                  ],
                ),

                // Text("dsadasd"+controller.currentid.toString())
              ])));
        });
      },
    );
  }
}
