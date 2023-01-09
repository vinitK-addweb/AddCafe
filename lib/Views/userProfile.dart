import 'dart:convert';
// import '../Components/MainDrawer.dart';
import '../GetxController/MyHomePage_controller.dart';
import '../Views/AddNewAddress.dart';
import 'package:addcafe/Components/AppBarStyle.dart';
import 'package:addcafe/Views/Auth/Signin.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';
import 'package:addcafe/GetxController/UserAuth_controller.dart';
import '../GetxController/UserProfile_controller.dart';
import '../Utils/Constant.dart';
import '../Styles/TextStyles.dart';
import '../Styles/ColorStyle.dart';
import '../Components/ElevatedButtonCustom.dart';
import '../Styles/EffectStyle.dart';
import '../Components/TextFieldCustom.dart';
import '../Components/ElevatedButtonCustom.dart';
import '../Components/PickerCustom.dart';

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
        // drawer: const MainDrawer(),
        appBar: AppBarStyle(
          styleTitle: TextStylesCustom.textStyles_20,
          title: 'Profile',
          backgroundColor: ColorStyle.primaryColorRed,
          leading: IconButton(
            onPressed: () => homPageController.currentIndex.value = 0,
            // scaffoldKey.currentState!.openDrawer(),
            // currentIndex.value = 0,
            icon: const Icon(
              Icons.arrow_back,
              size: 24,
              color: Colors.white,
            ),
          ),
        ),
        body: GetBuilder(
            init: UserAuth(),
            initState: ((_) {
              userAuth.getlocaStorage();
              controller.getUserDetails();
            }),
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
                            // Text(controller.addAddress[0].toString()),
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
                                                BorderRadius.circular(60),
                                            child: CircleAvatar(
                                              radius: 65,
                                              child: controller.image.value.path
                                                      .isNotEmpty
                                                  ? Image.file(
                                                      controller.image.value,
                                                      fit: BoxFit.cover,
                                                      height: 65 * 2,
                                                      width: 65 * 2,
                                                    )
                                                  : Image.network(
                                                      userAuth.userprofile
                                                              .isEmpty
                                                          ? 'https://mir-s3-cdn-cf.behance.net/user/276/462829507061295.5f9717443f152.png'
                                                          : userAuth.userprofile[
                                                                      'profile_picture'] ==
                                                                  null
                                                              ? 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSi6mIqR-61xHjJUEMUfzQvP_ZeVtRZ-Hh_B9OQIh5hLjVH1ZO5U23ZehKJMmIsZkMF5Ew&usqp=CAU'
                                                              : '${kImgUrl}${userAuth.userprofile['profile_picture']}',
                                                    ),
                                            )),
                                      ),
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
                                            // controller.getImage(),
                                            elevation: 2,
                                            fillColor: Color(0xFFF5F6F9),
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
                                          height: 15,
                                        ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      userAuth.userprofile['first_name'] == null
                                          ? const SizedBox(
                                              height: 0,
                                            )
                                          : Text(
                                              '${userAuth.userprofile['first_name']} ${userAuth.userprofile['last_name']}',
                                              style: TextStylesCustom
                                                  .textStyles_26
                                                  .apply(
                                                      fontWeightDelta: 2,
                                                      fontSizeDelta: 4,
                                                      color: ColorStyle
                                                          .primaryColorGreen),
                                            ),
                                      userAuth.userprofile['first_name'] != null
                                          ? userAuth.userprofile['is_verify']
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
                                    height: 10,
                                  ),
                                  // ),

                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                          userAuth.userprofile.isEmpty
                                              ? '${userAuth.userprofile}'
                                              : userAuth.userprofile['email'] ??
                                                  '',
                                          style: TextStylesCustom.textStyles_22
                                              .apply(
                                                  fontWeightDelta: 2,
                                                  color: ColorStyle
                                                      .primaryColorGreen)),
                                      userAuth.userprofile['is_email_verify']
                                          ? Icon(
                                              Icons.verified,
                                              color:
                                                  ColorStyle.primaryColorGreen,
                                            )
                                          : const Icon(
                                              Icons.verified,
                                              color: Colors.grey,
                                            )
                                    ],
                                  ),
                                ],
                              ),
                            ),
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
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                padding: const EdgeInsets.only(bottom: 5),
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            width: 3,
                                            color:
                                                ColorStyle.primaryColorRed))),
                                child: Text(
                                  'Change Password',
                                  style: TextStylesCustom.textStyles_20
                                      .apply(fontWeightDelta: 3),
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
                                                // controller: controller.textController.value,
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
                                                  // controller: controller.textController.value,
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
                                                      .newPassword.value,
                                                  padding:
                                                      const EdgeInsets.all(10),
                                                  labelText:
                                                      'Confirm New Password',
                                                  // controller: controller.textController.value,
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
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                padding: const EdgeInsets.only(bottom: 5),
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            width: 3,
                                            color:
                                                ColorStyle.primaryColorRed))),
                                child: Text(
                                  'Address',
                                  style: TextStylesCustom.textStyles_20
                                      .apply(fontWeightDelta: 3),
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
                                                          // Get.to(AddNewAddress(
                                                          //   isAddress: false,
                                                          // ));
                                                        },
                                                      ),
                                                      // const SizedBox(
                                                      //   width: 10,
                                                      // ),
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
                                      // const SizedBox(
                                      //   height: 10,
                                      // ),
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
                                          // showModalBottomSheet(
                                          //     isScrollControlled: true,
                                          //     backgroundColor: Colors.transparent,
                                          //     shape: RoundedRectangleBorder(
                                          //         borderRadius: BorderRadius.vertical(
                                          //             top: Radius.circular(20))),
                                          //     context: context,
                                          //     builder: (context) => AddNewAddress());
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
