import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../GetxController/Faq_Controller.dart';
import '../Styles/TextStyles.dart';
import '../Styles/ColorStyle.dart';
import '../Components/AppBarStyle.dart';

class Faq extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final faq = Get.put(FaqController());
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return GetBuilder(
        init: FaqController(),
        initState: ((state) => faq.initMethod()),
        builder: ((controller) {
          return Obx(() {
            return Scaffold(
              // <------------------------------ Main App bar starts --------------------->
              key: scaffoldKey,

              appBar: AppBarStyle(
                styleTitle: TextStylesCustom.textStyles_20,
                elevation: 0,
                title: 'FAQ',
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

              body: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 5),
                      child: Column(
                          children:

                              // <------------------ Faq card start-------------->
                              faq.faqData.map((e) {
                        return Stack(children: [
                          InkWell(
                            onTap: () {
                              if (faq.currentid.value == e.id) {
                                faq.currentid.value = 0;
                              } else {
                                faq.currentid.value = e.id!;
                              }
                            },
                            child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(20),
                                          topRight: Radius.circular(20)),
                                      color: Color.fromARGB(255, 245, 237, 237),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 10.0,
                                              right: 20,
                                              top: 10,
                                              bottom: 10),
                                          child: Text(
                                            '${e.question}',
                                            style: TextStylesCustom
                                                .textStyles_16
                                                .apply(
                                              fontWeightDelta: 3,
                                              color:
                                                  ColorStyle.secondryColorBlack,
                                            ),
                                          ),
                                        ),
                                        Visibility(
                                          visible: faq.currentid.value == e.id,
                                          child: Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Text(
                                              '${e.answer}',
                                              textAlign: TextAlign.justify,
                                              style: TextStylesCustom
                                                  .textStyles_13
                                                  .apply(
                                                fontWeightDelta: 2,
                                                color: ColorStyle
                                                    .secondaryColorgrey,
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ))),
                          ),

                          // <------------------- Right side dropdown arrow ---------------->
                          Positioned(
                              right: 5,
                              child: IconButton(
                                  icon: Icon(
                                    faq.currentid.value == e.id
                                        ? Icons.arrow_drop_up
                                        : Icons.arrow_drop_down,
                                    size: 40,
                                  ),
                                  onPressed: () {
                                    if (faq.currentid.value == e.id) {
                                      faq.currentid.value = 0;
                                    } else {
                                      faq.currentid.value = e.id!;
                                    }
                                  }))
                        ]);
                      }).toList()),
                    ),
                    Container(
                        margin: const EdgeInsets.all(10.0),
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.all(15),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              topRight: Radius.circular(20)),
                          color: Color.fromARGB(255, 245, 237, 237),
                        ),
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/images/faqs.png',
                            ),
                            Container(
                                margin: const EdgeInsets.only(top: 10),
                                child: Text(
                                  'Do you have more questions?',
                                  style: TextStylesCustom.textStyles_17.apply(
                                    fontWeightDelta: 3,
                                    color: ColorStyle.secondryColorBlack,
                                  ),
                                )),
                            Container(
                                margin:
                                    const EdgeInsets.only(top: 8, bottom: 20),
                                child: Text(
                                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                                  textAlign: TextAlign.center,
                                  style: TextStylesCustom.textStyles_13.apply(
                                    fontWeightDelta: 3,
                                    color: ColorStyle.secondaryColorgrey,
                                  ),
                                )),
                            SizedBox(
                                width: MediaQuery.of(context).size.width,
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(12)),
                                        padding: const EdgeInsets.all(20)),
                                    onPressed: () {},
                                    child: Text(
                                      'Send Us A Direct Mail',
                                      style:
                                          TextStylesCustom.textStyles_16.apply(
                                        fontWeightDelta: 3,
                                        color: Colors.white,
                                      ),
                                    )))
                          ],
                        ))
                  ],
                ),
              ),
            );
          });
        }));
  }
}
