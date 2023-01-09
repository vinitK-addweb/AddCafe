import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../GetxController/UserProfile_controller.dart';
import '../../Styles/ColorStyle.dart';
import '../../Styles/TextStyles.dart';
import '../AddNewAddress.dart';

class Address extends StatelessWidget {
  Address({super.key});
  final userProfile = Get.put(UserProfileController());
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
        initialChildSize: 0.7,
        maxChildSize: 0.9,
        minChildSize: 0.5,
        builder: (_, controller) => ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(color: ColorStyle.white),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Select an Address",
                        style: TextStylesCustom.textStyles_24
                            .apply(fontWeightDelta: 3),
                      ),
                      IconButton(
                          onPressed: (() => Get.back()),
                          icon: Icon(
                            Icons.close,
                            color:
                                ColorStyle.secondryColorBlack.withOpacity(0.7),
                            size: 28,
                          ))
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Container(
                      width: double.infinity,
                      color: Colors.white,
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: userProfile.addAddress.length,
                        itemBuilder: (context, index) {
                          return ListTile(title: Obx(() {
                            return InkWell(
                              onTap: () {
                                userProfile.address.value = index;
                                Future.delayed(Duration(milliseconds: 10), () {
                                  userProfile.update();
                                  Get.back();
                                });
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "DELIVERS TO ",
                                    //  +
                                    //     userProfile.address.value.toString(),
                                    style: TextStylesCustom.textStyles_13
                                        .apply(color: Colors.blueAccent),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
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
                                          '${userProfile.addAddress[index].buildingNumName},${userProfile.addAddress[index].areaColony},${userProfile.addAddress[index].landmark},${userProfile.addAddress[index].city},${userProfile.addAddress[index].state},${userProfile.addAddress[index].pincode}',
                                          style: TextStylesCustom.textStyles_19,
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
                                          '${userProfile.addAddress[index].phoneNum}',
                                          style: TextStylesCustom.textStyles_19,
                                        ),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
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
                                          '${userProfile.addAddress[index].addressType}',
                                          style: TextStylesCustom.textStyles_19,
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
                                          onPressed: () {
                                            userProfile.fetchAddressByid(
                                                userProfile
                                                    .addAddress[index].id);
                                            Get.to(AddNewAddress(
                                              isAddress: false,
                                            ));
                                          },
                                        ),
                                        // const SizedBox(
                                        //   width: 10,
                                        // ),
                                        Text(
                                          '|',
                                          style: TextStylesCustom.textStyles_20,
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
                                            userProfile.deleteAddress(
                                                userProfile
                                                    .addAddress[index].id);
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }));
                        },
                      ),
                    ),
                  ),
                ),
              ],
            )));
  }
}
