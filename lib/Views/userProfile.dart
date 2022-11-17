import 'dart:convert';
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

class UserProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userAuth = Get.put(UserAuth());
    final controller = Get.put(UserProfileController());

    return Scaffold(
        appBar: AppBarStyle(
          styleTitle: TextStylesCustom.textStyles_24,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Get.back(),
            color: Colors.white,
          ),
          backgroundColor: ColorStyle.primaryColorRed,
          title: 'Profile',
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

                          Container(
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, bottom: 30, top: 30),
                            decoration: boxDecorationAuthBox(),
                            child: Column(
                              children: [
                                Stack(children: [
                                  CircleAvatar(
                                    child: CircleAvatar(
                                        radius: 65,
                                        backgroundImage: NetworkImage(
                                          userAuth.userprofile.isEmpty
                                              ? 'https://mir-s3-cdn-cf.behance.net/user/276/462829507061295.5f9717443f152.png'
                                              : userAuth.userprofile[
                                                          'profile_picture'] ==
                                                      null
                                                  ? 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSi6mIqR-61xHjJUEMUfzQvP_ZeVtRZ-Hh_B9OQIh5hLjVH1ZO5U23ZehKJMmIsZkMF5Ew&usqp=CAU'
                                                  : '${kImgUrl}/${userAuth.userprofile['profile_picture']}',
                                        )),
                                    backgroundColor:
                                        ColorStyle.primaryColorGreen,
                                    radius: 70,
                                  ),
                                  Positioned(
                                      bottom: 0,
                                      right: -25,
                                      child: RawMaterialButton(
                                        onPressed: () => controller.getImage(),
                                        elevation: 2,
                                        fillColor: Color(0xFFF5F6F9),
                                        child: Icon(
                                          Icons.camera_alt_outlined,
                                          color: ColorStyle.primaryColorRed,
                                        ),
                                        padding: const EdgeInsets.all(8.0),
                                        shape: CircleBorder(),
                                      )),
                                ]),
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
                                        ? SizedBox(
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
                                        ? Icon(
                                            Icons.verified,
                                            color: ColorStyle.primaryColorGreen,
                                          )
                                        : SizedBox(
                                            height: 0,
                                          )
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                // ),
                                //Text('${userAuth.userprofile}')
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                        userAuth.userprofile.isEmpty
                                            ? '${userAuth.userprofile}'
                                            : userAuth.userprofile['email'] ==
                                                    null
                                                ? ''
                                                : userAuth.userprofile['email'],
                                        style: TextStylesCustom.textStyles_22
                                            .apply(
                                                fontWeightDelta: 2,
                                                color: ColorStyle
                                                    .primaryColorGreen)),
                                    Icon(
                                      Icons.account_circle,
                                      color: ColorStyle.secondryColorYellow,
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
// ------------------------ Changed password ------------------------------>
                          SizedBox(
                            height: 20,
                          ),

                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            padding: EdgeInsets.only(bottom: 5),
                            child: Text(
                              'Change Password',
                              style: TextStylesCustom.textStyles_26
                                  .apply(fontWeightDelta: 3),
                            ),
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        width: 3,
                                        color: ColorStyle.primaryColorRed))),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          PasswordFieldUnderline(
                            controller: controller.currentPassword.value,
                            padding: EdgeInsets.all(10),
                            labelText: 'Enter Current Password',
                            // controller: controller.textController.value,
                            hintText: '*********',
                            textStyle: TextStylesCustom.textStyles_20,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          PasswordFieldUnderline(
                            controller: controller.newPassword.value,
                            padding: EdgeInsets.all(10),
                            labelText: 'Enter New Password',
                            // controller: controller.textController.value,
                            hintText: '*********',
                            textStyle: TextStylesCustom.textStyles_20,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          ElevatedButtonCustom(
                            BgColor: ColorStyle.primaryColorRed,
                            text: 'Change Password',
                            radiusBorder: 5,
                            size: Size(
                                MediaQuery.of(context).size.width / 2.2, 40),
                            onTap: (() {
                              controller.changePasswordValidation();
                            }),
                          ),
                          SizedBox(
                            height: 20,
                          ),
// ------------------------ Add New Address ------------------------------>
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            padding: EdgeInsets.only(bottom: 5),
                            child: Text(
                              'Saved Address',
                              style: TextStylesCustom.textStyles_26
                                  .apply(fontWeightDelta: 3),
                            ),
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        width: 3,
                                        color: ColorStyle.primaryColorRed))),
                          ),

                          const SizedBox(
                            height: 20,
                          ),

                          ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
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
                                          size: 21,
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Expanded(
                                          child: Text(
                                            '${controller.addAddress[index].buildingNumName},${controller.addAddress[index].areaColony},${controller.addAddress[index].landmark},${controller.addAddress[index].city},${controller.addAddress[index].state},${controller.addAddress[index].pincode}',
                                            style:
                                                TextStylesCustom.textStyles_19,
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
                                          size: 21,
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Expanded(
                                          child: Text(
                                            '${controller.addAddress[index].phoneNum}',
                                            style:
                                                TextStylesCustom.textStyles_19,
                                          ),
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Icon(
                                          Icons.home,
                                          size: 21,
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Expanded(
                                          child: Text(
                                            '${controller.addAddress[index].addressType}',
                                            style:
                                                TextStylesCustom.textStyles_19,
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
                                                  .textStyles_16
                                                  .apply(
                                                      color: ColorStyle
                                                          .primaryColorGreen),
                                            ),
                                            onPressed: () =>
                                                Get.to(AddNewAddress(
                                              isAddress: false,
                                            )),
                                          ),
                                          // const SizedBox(
                                          //   width: 10,
                                          // ),
                                          Text(
                                            '|',
                                            style:
                                                TextStylesCustom.textStyles_20,
                                          ),
                                          TextButton(
                                            child: Text(
                                              'Remove',
                                              style: TextStylesCustom
                                                  .textStyles_16
                                                  .apply(
                                                      color: ColorStyle
                                                          .primaryColorGreen),
                                            ),
                                            onPressed: () {
                                              controller.deleteAddress(
                                                  controller
                                                      .addAddress[index].id);
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),

                          const SizedBox(
                            height: 30,
                          ),

                          ElevatedButtonCustom(
                            BgColor: ColorStyle.primaryColorRed,
                            text: '+ Add Address',
                            radiusBorder: 5,
                            size: Size(
                                MediaQuery.of(context).size.width / 2.5, 40),
                            onTap: () {
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
                        ]),
                  ),
                );
              });
            }));
  }
}
