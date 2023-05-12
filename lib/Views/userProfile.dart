import 'dart:convert';
import 'dart:developer';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../Utils/Constant.dart';
import '../Styles/TextStyles.dart';
import '../Styles/ColorStyle.dart';
import '../Styles/EffectStyle.dart';
import '../Utils/Global.dart';
import '../Views/AddNewAddress.dart';
import 'package:flutter/material.dart';
import '../Components/PickerCustom.dart';
import '../Components/TextFieldCustom.dart';
import 'package:addcafe/Views/Auth/Signin.dart';
import '../Components/ElevatedButtonCustom.dart';
import 'package:addcafe/Components/AppBarStyle.dart';
import '../GetxController/MyHomePage_controller.dart';
import '../GetxController/UserProfile_controller.dart';
import 'package:addcafe/GetxController/UserAuth_controller.dart';

import 'OrderHistoryDetails.dart';

class UserProfile extends StatelessWidget {
  final userAuth = Get.put(UserAuth());
  final controller = Get.put(UserProfileController());
  var formKey = GlobalKey<FormState>();
  final homPageController = Get.put(HomeBannerController());
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        appBar: AppBarStyle(
          styleTitle: TextStylesCustom.textStyles_20,
          title: 'Profile',
          backgroundColor: ColorStyle.primaryColorRed,
          leading: IconButton(
            onPressed: () => homPageController.currentIndex.value = 0,
            icon: const Icon(
              Icons.arrow_back,
              size: 24,
              color: Colors.white,
            ),
          ),
        ),
        body: GetBuilder(
            init: UserAuth(),
            initState: (state) {
              SchedulerBinding.instance.scheduleFrameCallback((timeStamp) {
                userAuth.getlocaStorage();
                // controller.getUserDetails();
                controller.initprofile();
              });
            },
            builder: (_) {
              return Obx(() {
                return SingleChildScrollView(
                  child: Container(
                      margin: const EdgeInsets.only(right: 15, left: 15),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 40,
                            ),

                            Container(
                              padding: const EdgeInsets.only(
                                  left: 20, right: 20, bottom: 30, top: 30),
                              decoration: boxDecorationAuthBox(),
                              child: Column(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      PickerCustom.imagePicker(
                                        (file) {
                                          controller.image.value = file;
                                          controller.updateProfileImage();
                                        },
                                      );
                                    },
                                    child: Stack(children: [
                                      CircleAvatar(
                                          backgroundColor:
                                              ColorStyle.primaryColorGreen,
                                          radius: 72,
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(70),
                                            child: CircleAvatar(
                                              radius: 65,
                                              child: controller.image.value.path
                                                      .isNotEmpty
                                                  ? Image.file(
                                                      controller.image.value,
                                                      fit: BoxFit.cover,
                                                      width: double.infinity,
                                                    )
                                                  : Image.network(
                                                      fit: BoxFit.cover,
                                                      height: double.infinity,
                                                      width: double.infinity,
                                                      userAuth.userprofile
                                                              .isEmpty
                                                          ? 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSi6mIqR-61xHjJUEMUfzQvP_ZeVtRZ-Hh_B9OQIh5hLjVH1ZO5U23ZehKJMmIsZkMF5Ew&usqp=CAU'
                                                          : '$kImgUrl${userAuth.userprofile['profile_picture']}',
                                                    ),
                                            ),
                                          )),
                                      Positioned(
                                          bottom: 0,
                                          right: -25,
                                          child: RawMaterialButton(
                                            onPressed: () {
                                              PickerCustom.imagePicker(
                                                (file) {
                                                  controller.image.value = file;
                                                  controller
                                                      .updateProfileImage();
                                                },
                                              );
                                            },
                                            elevation: 2,
                                            fillColor: const Color(0xFFF5F6F9),
                                            padding: const EdgeInsets.all(8.0),
                                            shape: const CircleBorder(),
                                            child: Icon(
                                              Icons.camera_alt_outlined,
                                              color: ColorStyle.primaryColorRed,
                                            ),
                                          )),
                                    ]),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  userAuth.userprofile.isEmpty
                                      ? const SizedBox(
                                          height: 15,
                                        )
                                      :
                                      // <-------------------user profile details -------------------->

                                      const SizedBox(
                                          height: 10,
                                        ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      controller.fname.value.text.isEmpty
                                          ? const SizedBox(
                                              height: 0,
                                            )
                                          : Text(
                                              '${controller.fname.value.text} ${controller.lname.value.text}',
                                              style: TextStylesCustom
                                                  .textStyles_13
                                                  .apply(
                                                      fontWeightDelta: 2,
                                                      fontSizeDelta: 4,
                                                      color: ColorStyle
                                                          .primaryColorGreen),
                                            ),
                                      SizedBox(
                                        width: 2,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          controller.showEditProfile.value =
                                              !controller.showEditProfile.value;
                                        },
                                        child: Icon(
                                          Icons.edit,
                                          size: 20,
                                          color: ColorStyle.secondryColorRed,
                                        ),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 2,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      controller.mobile.value.text.isEmpty
                                          ? const SizedBox(
                                              height: 0,
                                            )
                                          : Text(
                                              '${controller.mobile.value.text} ',
                                              style: TextStylesCustom
                                                  .textStyles_13
                                                  .apply(
                                                      fontWeightDelta: 2,
                                                      fontSizeDelta: 4,
                                                      color: ColorStyle
                                                          .primaryColorGreen),
                                            ),
                                      controller.userprofile['is_verify'] !=
                                              null
                                          ? controller.userprofile['is_verify']
                                              ? Icon(
                                                  Icons.verified,
                                                  color: ColorStyle
                                                      .primaryColorGreen,
                                                )
                                              : const Icon(
                                                  Icons.verified,
                                                  color: Colors.grey,
                                                )
                                          : const SizedBox(
                                              height: 0,
                                            )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 2,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      controller.fname.value.text.isEmpty
                                          ? const SizedBox(
                                              height: 0,
                                            )
                                          : Text(
                                              '${controller.email.value.text} ',
                                              style: TextStylesCustom
                                                  .textStyles_13
                                                  .apply(
                                                      fontWeightDelta: 2,
                                                      fontSizeDelta: 4,
                                                      color: ColorStyle
                                                          .primaryColorGreen),
                                            ),
                                      controller.userprofile[
                                                  'is_email_verify'] !=
                                              null
                                          ? controller.userprofile[
                                                  'is_email_verify']
                                              ? Icon(
                                                  Icons.verified,
                                                  color: ColorStyle
                                                      .primaryColorGreen,
                                                )
                                              : const Icon(
                                                  Icons.verified,
                                                  color: Colors.grey,
                                                )
                                          : const SizedBox(
                                              height: 0,
                                            )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Icon(
                                        Icons.wallet,
                                        size: 25,
                                        color: ColorStyle.secondryColorRed,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        controller.wallet.value + " ₹",
                                        style: TextStylesCustom.textStyles_15
                                            .apply(fontWeightDelta: 3),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                            ),
                            // ------------------------ Edit Profile------------------------------>
                            const SizedBox(
                              height: 20,
                            ),

                            InkWell(
                              onTap: () {
                                controller.showEditProfile.value =
                                    !controller.showEditProfile.value;
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                padding: const EdgeInsets.only(bottom: 5),
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            width: 3,
                                            color:
                                                ColorStyle.primaryColorRed))),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Edit Profile',
                                      style: TextStylesCustom.textStyles_20
                                          .apply(fontWeightDelta: 3),
                                    ),
                                    Icon(controller.showEditProfile.value
                                        ? Icons.keyboard_arrow_up
                                        : Icons.keyboard_arrow_down)
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            controller.showEditProfile.value
                                ? Form(
                                    key: formKey,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        TextFormFieldUnderline(
                                          controller: controller.fname.value,
                                          padding: const EdgeInsets.all(10),
                                          labelText: 'Your Name',
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return 'Enter Your First Name';
                                            } else {
                                              return null;
                                            }
                                          },
                                          textStyle:
                                              TextStylesCustom.textStyles_16,
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        TextFormFieldUnderline(
                                          controller: controller.lname.value,
                                          padding: const EdgeInsets.all(10),
                                          labelText: 'Your Last Name',
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return 'Enter Your Last Name';
                                            } else {
                                              return null;
                                            }
                                          },
                                          textStyle:
                                              TextStylesCustom.textStyles_16,
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        TextFormFieldUnderline(
                                          controller: controller.email.value,
                                          padding: const EdgeInsets.all(10),
                                          labelText: 'Your Email',
                                          validator: (value) {
                                            if (!GetUtils.isEmail(value!)) {
                                              return 'Enter a Valid Email Address ';
                                            } else {
                                              return null;
                                            }
                                          },
                                          textStyle:
                                              TextStylesCustom.textStyles_16,
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        TextFormFieldUnderline(
                                          keyboardType: TextInputType.number,
                                          controller: controller.mobile.value,
                                          padding: const EdgeInsets.all(10),
                                          labelText: 'Your Mobile No.',
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return "Please Enter your Mobile Number";
                                            } else if (value.length != 10) {
                                              return 'Mobile Number Should Be 10 Digits';
                                            } else {
                                              log("hello");
                                              return null;
                                            }
                                          },
                                          textStyle:
                                              TextStylesCustom.textStyles_16,
                                        ),

                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Text(
                                          "Gender*",
                                          style: TextStylesCustom.textStyles_18,
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(controller
                                                .selectedgender.value.isNotEmpty
                                            ? ''
                                            : ''),
                                        Obx(() {
                                          return SizedBox(
                                              height: 80,
                                              child: ListView.builder(
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  shrinkWrap: true,
                                                  itemCount:
                                                      controller.genders.length,
                                                  itemBuilder:
                                                      (context, index) {
                                                    return InkWell(
                                                      splashColor: ColorStyle
                                                          .secondryColorRed,
                                                      onTap: () {
                                                        controller
                                                                .selectedgender
                                                                .value =
                                                            controller.genders[
                                                                index][2];
                                                      },
                                                      child: Card(
                                                          color: controller
                                                                      .selectedgender
                                                                      .value ==
                                                                  controller
                                                                          .genders[
                                                                      index][2]
                                                              ? Color(
                                                                  0xFF3B4257)
                                                              : Colors.white,
                                                          child: Container(
                                                            height: 40,
                                                            width: 50,
                                                            alignment: Alignment
                                                                .center,
                                                            margin:
                                                                const EdgeInsets
                                                                    .all(12.0),
                                                            child: Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                              children: <
                                                                  Widget>[
                                                                Icon(
                                                                  controller
                                                                          .genders[
                                                                      index][1],
                                                                  color: controller
                                                                              .selectedgender.value ==
                                                                          controller.genders[index]
                                                                              [
                                                                              2]
                                                                      ? Colors
                                                                          .white
                                                                      : Colors
                                                                          .grey,
                                                                  size: 16,
                                                                ),
                                                                const SizedBox(
                                                                    height: 10),
                                                                Text(
                                                                  controller
                                                                          .genders[
                                                                      index][0],
                                                                  style: TextStylesCustom
                                                                      .textStyles_12
                                                                      .apply(
                                                                          color: controller.selectedgender.value == controller.genders[index][2]
                                                                              ? Colors.white
                                                                              : Colors.grey),
                                                                )
                                                              ],
                                                            ),
                                                          )),
                                                    );
                                                  }));
                                        }),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        TextFormField(
                                            controller: controller.dob.value,
                                            validator: (value) {
                                              if (value!.isEmpty) {
                                                return 'Field is required';
                                              } else {
                                                return null;
                                              }
                                            },
                                            decoration: const InputDecoration(
                                                prefixIcon: Icon(Icons
                                                    .calendar_today), //icon of text field
                                                labelText:
                                                    "D.O.B" //label text of field
                                                ),
                                            readOnly:
                                                true, // when true user cannot edit text
                                            onTap: () async {
                                              final dob =
                                                  await PickerCustom.datePicker(
                                                      'yyyy-MM-dd');
                                              controller.dob.value.text = dob ==
                                                      null
                                                  ? controller.dob.value.text
                                                  : dob.toString();
                                              // print(dob.toString());
                                              //when click we have to show the datepicker
                                            }),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        ElevatedButtonCustom(
                                          BgColor: ColorStyle.primaryColorRed,
                                          text: 'Edit Profile',
                                          radiusBorder: 5,
                                          size: Size(
                                              MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  2.2,
                                              40),
                                          onTap: (() {
                                            if (formKey.currentState!
                                                .validate()) {
                                              controller.editProfile();
                                            }
                                          }),
                                        )
                                        //   ],
                                        // )
                                      ],
                                    ))
                                : const SizedBox(
                                    height: 0,
                                  ),

                            // ------------------------ Order History ------------------------------>
                            const SizedBox(
                              height: 20,
                            ),

                            InkWell(
                              onTap: () {
                                controller.showOrderHistory.value =
                                    !controller.showOrderHistory.value;
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                padding: const EdgeInsets.only(bottom: 5),
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            width: 3,
                                            color:
                                                ColorStyle.primaryColorRed))),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Order History',
                                      style: TextStylesCustom.textStyles_20
                                          .apply(fontWeightDelta: 3),
                                    ),
                                    Icon(controller.showOrderHistory.value
                                        ? Icons.keyboard_arrow_up
                                        : Icons.keyboard_arrow_down)
                                  ],
                                ),
                              ),
                            ),

                            const SizedBox(
                              height: 30,
                            ),

                            ...controller.orderHistory.map(
                              (
                                e,
                              ) {
                                return controller.showOrderHistory.value
                                    ? Container(
                                        padding: const EdgeInsets.all(10),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              child: Image.network(
                                                "$kImgUrl${e["product"][0]['product_detail']['featured_image']}",
                                                // kImgUrl +
                                                //     e.itemDetail!
                                                //         .featuredImage
                                                //         .toString(),
                                                height: 90.0,
                                                width: 90.0,
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Expanded(
                                              child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    // Text("$kImgUrl${ e["product"][0]['product_detail']['featured_image']}"),
                                                    Text(
                                                      "Order Number -",
                                                      style: TextStylesCustom
                                                          .textStyles_14
                                                          .apply(
                                                              fontWeightDelta:
                                                                  3),
                                                    ),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    Text(
                                                      e['order_number']
                                                          .toString(),
                                                      style: TextStylesCustom
                                                          .textStyles_12,
                                                    ),

                                                    const SizedBox(
                                                      height: 7,
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          'Order Items - ${e["product"].length}',
                                                          style: TextStylesCustom
                                                              .textStyles_12
                                                              .apply(
                                                                  fontWeightDelta:
                                                                      2),
                                                        ),
                                                        Text(
                                                          '₹ ${e["order_total_cost"]}',
                                                          style: TextStylesCustom
                                                              .textStyles_12
                                                              .apply(
                                                                  fontWeightDelta:
                                                                      2,
                                                                  color: ColorStyle
                                                                      .primaryColorGreen),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceAround,
                                                      children: [
                                                        ElevatedButton.icon(
                                                          onPressed: () {},

                                                          style: ElevatedButton
                                                              .styleFrom(
                                                                  // padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
                                                                  shape: RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10.0)),
                                                                  primary:
                                                                      ColorStyle
                                                                          .secondryColorRed),
                                                          icon: Icon(
                                                            // <-- Icon
                                                            Icons
                                                                .repeat_outlined,
                                                            size: 12.0,
                                                          ),
                                                          label: Text('Repeat',
                                                              style: TextStylesCustom
                                                                  .textStyles_9), // <-- Text
                                                        ),
                                                        ElevatedButton.icon(
                                                          onPressed: () {
                                                            log("tapping----------");
                                                            Get.to(OrderHistoryDetails(
                                                                orderDetailData:
                                                                    e));
                                                          },

                                                          style: ElevatedButton
                                                              .styleFrom(
                                                                  side:
                                                                      BorderSide(
                                                                    width: 2.0,
                                                                    color: ColorStyle
                                                                        .primaryColorGreen,
                                                                  ),
                                                                  shape: RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10.0)),
                                                                  primary: Colors
                                                                      .white),

                                                          icon: Icon(
                                                            // <-- Icon
                                                            Icons
                                                                .remove_red_eye_outlined,
                                                            color: ColorStyle
                                                                .secondryColorGreen,
                                                            size: 12.0,
                                                          ),
                                                          label: Text(
                                                            'Details',
                                                            style: TextStylesCustom
                                                                .textStyles_9
                                                                .apply(
                                                                    color: ColorStyle
                                                                        .primaryColorGreen),
                                                          ), // <-- Text
                                                        ),
                                                      ],
                                                    )
                                                  ]),
                                            ),
                                          ],
                                        ),
                                      )
                                    : SizedBox(
                                        height: 0,
                                      );
                              },
                            ),
                            if (controller.orderHistory.isEmpty &&
                                controller.showOrderHistory.value)
                              Center(
                                  child: Text(
                                "No Data Found",
                                style: TextStylesCustom.textStyles_20,
                              )),
                            // ------------------------ Wallet History ------------------------------>
                            SizedBox(
                              height: 10,
                            ),
                            InkWell(
                              onTap: () {
                                controller.showWalletTransaction.value =
                                    !controller.showWalletTransaction.value;
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                padding: const EdgeInsets.only(bottom: 5),
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            width: 3,
                                            color:
                                                ColorStyle.primaryColorRed))),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Wallet Transition History',
                                      style: TextStylesCustom.textStyles_20
                                          .apply(fontWeightDelta: 3),
                                    ),
                                    Icon(controller.showWalletTransaction.value
                                        ? Icons.keyboard_arrow_up
                                        : Icons.keyboard_arrow_down)
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            SizedBox(
                              height: controller.showWalletTransaction.value
                                  ? controller.WalletHistory.length *
                                      controller.WalletHistory.length *
                                      80
                                  : 0,
                              child: controller.showWalletTransaction.value
                                  ? ListView.builder(
                                      shrinkWrap: true,
                                      itemCount:
                                          controller.WalletHistory.length,
                                      itemBuilder: (context, index) {
                                        return ListTile(
                                          leading: CircleAvatar(
                                            backgroundColor: Colors.grey[300],
                                            // child: Text(index.toString()),
                                          ),
                                          title: Text(
                                              chnageDateINMMMdyyyyFormat(
                                                  controller
                                                      .WalletHistory[index]
                                                          ["created_at"]
                                                      .toString()),
                                              style: TextStylesCustom
                                                  .textStyles_14),
                                          subtitle: Text(
                                              '${controller.WalletHistory[index]["message"]}',
                                              style: TextStylesCustom
                                                  .textStyles_12),
                                          trailing: Column(
                                            children: [
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                " ₹ ${controller.WalletHistory[index]["amount"]}",
                                                style: TextStylesCustom
                                                    .textStyles_12
                                                    .apply(
                                                        color: ColorStyle
                                                            .secondryColorRed),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text("Wallet",
                                                  style: TextStylesCustom
                                                      .textStyles_12
                                                      .apply(
                                                          color: ColorStyle
                                                              .secondaryColorgrey))
                                            ],
                                          ),
                                        );
                                      },
                                    )
                                  : SizedBox(),
                            ),
                            if (controller.WalletHistory.isEmpty &&
                                controller.showWalletTransaction.value)
                              Center(
                                  child: Text(
                                "No Data Found",
                                style: TextStylesCustom.textStyles_20,
                              )),
// ------------------------ Changed password ------------------------------>
                            const SizedBox(
                              height: 20,
                            ),

                            InkWell(
                              onTap: () {
                                controller.showPassField.value =
                                    !controller.showPassField.value;
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                padding: const EdgeInsets.only(bottom: 5),
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            width: 3,
                                            color:
                                                ColorStyle.primaryColorRed))),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Change Password',
                                      style: TextStylesCustom.textStyles_20
                                          .apply(fontWeightDelta: 3),
                                    ),
                                    Icon(controller.showPassField.value
                                        ? Icons.keyboard_arrow_up
                                        : Icons.keyboard_arrow_down)
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            controller.showPassField.value
                                ? Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Form(
                                          key: formKey,
                                          child: Column(
                                            children: [
                                              PasswordFieldUnderline(
                                                controller: controller
                                                    .currentPassword.value,
                                                padding:
                                                    const EdgeInsets.all(10),
                                                labelText:
                                                    'Enter Current Password',
                                                hintText: '*********',
                                                textStyle: TextStylesCustom
                                                    .textStyles_16,
                                                validator: (value) {
                                                  if (value!.isEmpty) {
                                                    return "Please Enter your Current Password";
                                                  } else {
                                                    return null;
                                                  }
                                                },
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              PasswordFieldUnderline(
                                                  controller: controller
                                                      .newPassword.value,
                                                  padding:
                                                      const EdgeInsets.all(10),
                                                  labelText:
                                                      'Enter New Password',
                                                  hintText: '*********',
                                                  textStyle: TextStylesCustom
                                                      .textStyles_16,
                                                  validator: (value) {
                                                    RegExp regex = RegExp(
                                                        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                                                    var passNonNullValue =
                                                        value ?? "";
                                                    if (passNonNullValue
                                                        .isEmpty) {
                                                      return ("Password is required");
                                                    } else if (passNonNullValue
                                                            .length <
                                                        6) {
                                                      return ("Password Must be more than 5 characters");
                                                    } else if (!regex.hasMatch(
                                                        passNonNullValue)) {
                                                      return ("Password Must upper,lower,digit & Special character ");
                                                    }
                                                    return null;
                                                  }),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              PasswordFieldUnderline(
                                                  controller: controller
                                                      .cnewPassword.value,
                                                  padding:
                                                      const EdgeInsets.all(10),
                                                  labelText:
                                                      'Confirm New Password',
                                                  hintText: '*********',
                                                  textStyle: TextStylesCustom
                                                      .textStyles_16,
                                                  validator: (value) {
                                                    if (controller.cnewPassword
                                                            .value.text !=
                                                        controller.newPassword
                                                            .value.text) {
                                                      return ("Your New Password & Current Password is Mismatch");
                                                    }

                                                    return null;
                                                  }),
                                            ],
                                          )),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      ElevatedButtonCustom(
                                        BgColor: ColorStyle.primaryColorRed,
                                        text: 'Change Password',
                                        radiusBorder: 5,
                                        size: Size(
                                            MediaQuery.of(context).size.width /
                                                2.2,
                                            40),
                                        onTap: (() {
                                          controller.getUserDetails();
                                          if (formKey.currentState!
                                              .validate()) {
                                            controller
                                                .changePasswordValidation();
                                          }
                                        }),
                                      )
                                    ],
                                  )
                                : const SizedBox(
                                    height: 0,
                                  ),
                            const SizedBox(
                              height: 20,
                            ),
// ------------------------ Add New Address ------------------------------>
                            InkWell(
                              onTap: () {
                                controller.showAddress.value =
                                    !controller.showAddress.value;
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                padding: const EdgeInsets.only(bottom: 5),
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            width: 3,
                                            color:
                                                ColorStyle.primaryColorRed))),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Address',
                                      style: TextStylesCustom.textStyles_20
                                          .apply(fontWeightDelta: 3),
                                    ),
                                    Icon(controller.showAddress.value
                                        ? Icons.keyboard_arrow_up
                                        : Icons.keyboard_arrow_down)
                                  ],
                                ),
                              ),
                            ),

                            const SizedBox(
                              height: 20,
                            ),
                            controller.showAddress.value
                                ? Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ListView.builder(
                                        shrinkWrap: true,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        itemCount: controller.addAddress.length,
                                        itemBuilder: (context, index) {
                                          return ListTile(
                                            title: Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    const Icon(
                                                      Icons.location_on,
                                                      size: 16,
                                                    ),
                                                    const SizedBox(
                                                      width: 10,
                                                    ),
                                                    Expanded(
                                                      child: Text(
                                                        '${controller.addAddress[index].buildingNumName},${controller.addAddress[index].areaColony},${controller.addAddress[index].landmark},${controller.addAddress[index].city},${controller.addAddress[index].state},${controller.addAddress[index].pincode}',
                                                        style: TextStylesCustom
                                                            .textStyles_14,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Row(
                                                  children: [
                                                    const Icon(
                                                      Icons.call,
                                                      size: 16,
                                                    ),
                                                    const SizedBox(
                                                      width: 10,
                                                    ),
                                                    Expanded(
                                                      child: Text(
                                                        '${controller.addAddress[index].phoneNum}',
                                                        style: TextStylesCustom
                                                            .textStyles_14,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Row(
                                                  // mainAxisAlignment:
                                                  //     MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    const Icon(
                                                      Icons.home,
                                                      size: 16,
                                                    ),
                                                    const SizedBox(
                                                      width: 10,
                                                    ),
                                                    Expanded(
                                                      child: Text(
                                                        '${controller.addAddress[index].addressType}',
                                                        style: TextStylesCustom
                                                            .textStyles_14,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Container(
                                                  decoration: BoxDecoration(
                                                      border: Border(
                                                          bottom: BorderSide(
                                                              width: 1,
                                                              color: ColorStyle
                                                                  .secondaryColorgrey))),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    // crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      TextButton(
                                                        child: Text(
                                                          'Edit',
                                                          style: TextStylesCustom
                                                              .textStyles_14
                                                              .apply(
                                                                  color: ColorStyle
                                                                      .primaryColorGreen),
                                                        ),
                                                        onPressed: () {
                                                          controller.AddUpdateid
                                                                  .value =
                                                              controller
                                                                  .addAddress[
                                                                      index]
                                                                  .id!;

                                                          controller
                                                              .fetchAddressByid(
                                                                  index);
                                                        },
                                                      ),
                                                      Text(
                                                        '|',
                                                        style: TextStylesCustom
                                                            .textStyles_20,
                                                      ),
                                                      TextButton(
                                                        child: Text(
                                                          'Remove',
                                                          style: TextStylesCustom
                                                              .textStyles_14
                                                              .apply(
                                                                  color: ColorStyle
                                                                      .primaryColorGreen),
                                                        ),
                                                        onPressed: () {
                                                          controller
                                                              .deleteAddress(
                                                                  controller
                                                                      .addAddress[
                                                                          index]
                                                                      .id);
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 20,
                                                )
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                                      ElevatedButtonCustom(
                                        BgColor: ColorStyle.primaryColorRed,
                                        text: '+ Add Address',
                                        radiusBorder: 5,
                                        size: Size(
                                            MediaQuery.of(context).size.width /
                                                2.5,
                                            40),
                                        onTap: () {
                                          controller.clearEdit();
                                          Get.to(AddNewAddress());
                                        },
                                      ),
                                      const SizedBox(
                                        height: 30,
                                      ),
                                    ],
                                  )
                                : const SizedBox(
                                    height: 0,
                                  )
                          ])),
                );
              });
            }));
  }
}
