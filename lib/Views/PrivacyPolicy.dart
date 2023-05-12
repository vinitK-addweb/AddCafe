import 'dart:developer';
import 'dart:ffi';
import 'package:addcafe/Utils/Global.dart';
import 'package:addcafe/Views/Auth/Signin.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:addcafe/Components/AppBarStyle.dart';
import 'package:addcafe/Views/Aboutus.dart';
import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';
import '../Components/ElevatedButtonCustom.dart';
import '../GetxController/PrivacyPolicy_controller.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../Styles/ColorStyle.dart';
import '../Styles/TextStyles.dart';
import '../Utils/Constant.dart';
import 'dart:ffi';

class PrivacyPolicy extends StatefulWidget {
  PrivacyPolicy({super.key});

  @override
  State<PrivacyPolicy> createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
  final controller = Get.put(PrivacyPolicyController());

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  var currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: PrivacyPolicyController(),
      initState:(state){
        SchedulerBinding.instance.scheduleFrameCallback((timeStamp) {
          controller.initfunction();
        });
    },
      builder: (_) {
        return Obx(() {
          return Scaffold(
            key: scaffoldKey,
            appBar: AppBarStyle(
              styleTitle: TextStylesCustom.textStyles_20,
              elevation: 0,
              title: 'Information-Review',
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
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "See What Our Happy Customers Tells",
                            textAlign: TextAlign.left,
                            style: TextStylesCustom.textStyles_16,
                          ))),
                  const SizedBox(
                    height: 10,
                  ),
                  // Text(controller.privacyPolicy.toString()),
                  CarouselSlider(
                    options: CarouselOptions(
                      height: 400.0,
                      autoPlay: true,
                      onPageChanged: (i, reason) {
                        // setState(() {
                        controller.currentIndex.value = i;
                        // log(currentIndex.toString());

                        // });
                      },
                    ),
                    items: controller.privacyPolicy.map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            child: Card(
                              borderOnForeground: true,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 15),
                                      child: Text(
                                        i["review"],
                                        style: TextStylesCustom.textStyles_12,
                                      )),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Review(
                                    photo: "",
                                    name: i["user_detail"]['name'],
                                    review: double.parse(i['rate'].toString()),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    }).toList(),
                  ),
                  if (controller.privacyPolicy.isNotEmpty)
                    DotsIndicator(
                      dotsCount: controller.privacyPolicy.length,
                      position: controller.currentIndex.value,
                    ),
                  const SizedBox(
                    height: 18,
                  ),
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Tell us what you feel for us without any hesitation !!",
                            textAlign: TextAlign.left,
                            style: TextStylesCustom.textStyles_16,
                          ))),
                  const SizedBox(
                    height: 18,
                  ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 18),
            child: Align(
            alignment: Alignment.topLeft,child:
                    RatingBar.builder(
                      initialRating: 3.5,
                      minRating: 0,
                      direction: Axis.horizontal,
                      // ignoreGestures: true,
                      itemSize: 25,
                      allowHalfRating: false,
                      itemCount: 5,
                      itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        controller.starRating.value =rating.toInt();
                        print(rating);
                      },
                    )
            ),
          ),

                  const SizedBox(
                    height: 18,
                  ),
                  Card(
                      surfaceTintColor: Colors.white12,
                      elevation: 0.5,
                      color: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: TextField(
                          controller: controller.reviewData,
                          maxLines: 8, //
                          enabled: islogin,// or null
                          decoration: InputDecoration.collapsed(
                            hintText: "Enter your text here",
                          ),
                          style: TextStylesCustom.textStyles_14,
                        ),
                      )),
                  ElevatedButton(

                      onPressed: () {
                        if(islogin){
                        if(controller.userReview.isNotEmpty){
                          controller.updateReviewRating();
                        }else
                       controller. ReviewRating();}else{
                          Get.to(Mylogin());
                        }
                      }, child: Text(islogin?"Submit Rating":"Please Login")),

                  AboutUs()
                ],
              ),
            ),
          );
        });
      },
    );
  }
}

class Review extends StatelessWidget {
  Review(
      {Key? key, required this.photo, required this.name, required this.review})
      : super(
          key: key,
        );

  final photo;
  final name;
  final review;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        photo == ""
            ? Icon(
                Icons.account_circle,
                size: 50,
              )
            : ImageIcon(
                NetworkImage(photo),
                size: 50,
              ),
        SizedBox(
          height: 10,
        ),
        Center(
            child: Text(
          name,
          style: TextStylesCustom.textStyles_12,
        )),
        SizedBox(
          height: 8,
        ),
        RatingBar.builder(
          initialRating: review,
          minRating: 0,
          direction: Axis.horizontal,
          ignoreGestures: true,
          itemSize: 25,
          allowHalfRating: false,
          itemCount: 5,
          itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
          itemBuilder: (context, _) => Icon(
            Icons.star,
            color: Colors.amber,
          ),
          onRatingUpdate: (rating) {
            print(rating);
          },
        )
        // photo ==""?Icon(Icons.verified_user):NetworkImage(photo)
      ],
    );
  }
}
