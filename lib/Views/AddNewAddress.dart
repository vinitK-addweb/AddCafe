import 'package:addcafe/Styles/ColorStyle.dart';
import 'package:addcafe/Views/Auth/Password.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Styles/SizeStyle.dart';
import '../Styles/TextStyles.dart';
import '../Components/TextFieldCustom.dart';
import '../GetxController/UserProfile_controller.dart';
import '../Components/AppBarStyle.dart';
import '../Styles/ColorStyle.dart';
import '../Styles/TextStyles.dart';
import '../Components/ElevatedButtonCustom.dart';
// import 'package:intl_phone_number_input/intl_phone_number_input.dart';
// import 'package:provider/provider.dart';
// import 'package:addcafe/Providers/apis/addAddressApi.dart';

class AddNewAddress extends StatelessWidget {
  AddNewAddress({super.key, this.isAddress = true});
  final formKey = GlobalKey<FormState>();
  final bool? isAddress;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserProfileController());
    // final scaffoldKey = GlobalKey<ScaffoldState>();

    //  final GlobalKey<FormState> _key = GlobalKey<FormState>()
    // final addaddressApi = Provider.of<AddaddressApi>(context, listen: false);
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBarStyle(
            styleTitle: TextStylesCustom.textStyles_24,
            backgroundColor: ColorStyle.primaryColorRed,
            title: isAddress! ? 'Add Address' : 'Update Address',
            leading: IconButton(
                icon: Icon(Icons.arrow_back), onPressed: () => Get.back())),
        // backgroundColor: Colors.transparent,
        // body: DraggableScrollableSheet(
        //   initialChildSize: 0.7,
        //   maxChildSize: 0.9,
        //   minChildSize: 0.5,
        //   builder: (_, controller) =>
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButtonCustom(
            radiusBorder: 50,
            BgColor: ColorStyle.primaryColorRed,
            onTap: () {
              debugPrint("add address");
              if (formKey.currentState!.validate()) {
                // debugPrint('Save is clicking ...');
                // controller.savePassword();
                // }

                isAddress!
                    ? controller.addNewAddress()
                    : controller.updateAddress();
              }
            },
            size: Size(MediaQuery.of(context).size.width, 50),
            text: isAddress! ? '+ Add Address' : 'Update Address',
          ),
        ),
        body:
//         GetBuilder(
//           init: UserProfileController(),
// // initState: controller.userprofile,
//           builder: (_) {
//             return

            // Obx(() {
            // return
            SingleChildScrollView(
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30)),
            child: SingleChildScrollView(
              // physics: NeverScrollableScrollPhysics(),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 15),
                color: Colors.white,
                child: Form(
                    key: formKey,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 20,
                          ),

                          const SizedBox(
                            height: 30,
                          ),
                          // TextFieldUnderline(
                          //   padding: EdgeInsets.all(10),
                          //   labelText: 'Phone Number or Email',
                          //   // controller: controller.textController.value,
                          //   hintText: 'John',
                          //   textStyle: TextStylesCustom.textStyles_20,
                          // ),
                          // Text(data),
                          TextFormFieldUnderline(
                            padding: EdgeInsets.all(10),
                            validator: (value) {
                              // if (value!.isEmpty) {
                              //   return "Please Enter Mobile Number";
                              //   // ignore: curly_braces_in_flow_control_structures
                              //   } else
                              if (value!.length != 10) {
                                return "Please Enter Mobile Number";
                              } else {
                                return null;
                              }
                            },
                            controller: controller.phoneNumber.value,
                            keyboardType: TextInputType.number,
                            labelText: 'Phone Number',
                            // readOnly: true,
                            // controller: controller.textController.value,
                            colorHint: ColorStyle.secondryColorBlack,
                            hintText: '987654321',
                            textStyle: TextStylesCustom.textStyles_20,
                          ),

                          const SizedBox(
                            height: 20,
                          ),

                          TextFormFieldUnderline(
                            padding: const EdgeInsets.all(10),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please Enter Building Name/Number";
                              } else {
                                return null;
                              }
                            },
                            controller: controller.buildingNameNo.value,
                            labelText: 'Building Name/Number',
                            hintText: 'arihant villa',
                            colorHint: ColorStyle.secondryColorBlack,
                            textStyle: TextStylesCustom.textStyles_20,
                          ),

                          const SizedBox(
                            height: 20,
                          ),
                          TextFormFieldUnderline(
                            padding: const EdgeInsets.all(10),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please Enter Area";
                              } else {
                                return null;
                              }
                            },
                            controller: controller.area.value,
                            textStyle: TextStylesCustom.textStyles_20,
                            hintText: 'Mansrover',
                            labelText: 'Area',
                            colorHint: ColorStyle.secondryColorBlack,
                          ),
                          // TextFieldUnderline(
                          //   controller: controller.area.value,
                          //   textStyle: TextStylesCustom.textStyles_20,
                          //   hintText: 'Mansrover',
                          //   labelText: 'Area',
                          // ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormFieldUnderline(
                            padding: EdgeInsets.all(10),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please Enter Land Mark";
                              } else {
                                return null;
                              }
                            },
                            controller: controller.landMark.value,
                            textStyle: TextStylesCustom.textStyles_20,
                            hintText: 'New Sanganer Road',
                            labelText: 'Land Mark',
                          ),
                          // TextFieldUnderline(
                          //   controller: controller.landMark.value,
                          //   textStyle: TextStylesCustom.textStyles_20,
                          //   hintText: 'New Sanganer Road',
                          //   labelText: 'Land Mark',
                          // ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormFieldUnderline(
                            padding: EdgeInsets.all(10),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please Enter City";
                              } else {
                                return null;
                              }
                            },
                            controller: controller.city.value,
                            textStyle: TextStylesCustom.textStyles_20,
                            hintText: 'Jaipur',
                            labelText: 'City',
                          ),

                          const SizedBox(
                            height: 20,
                          ),
                          TextFormFieldUnderline(
                            padding: EdgeInsets.all(10),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please Enter City";
                              } else {
                                return null;
                              }
                            },
                            controller: controller.state.value,
                            textStyle: TextStylesCustom.textStyles_20,
                            hintText: 'Rajasthan',
                            labelText: 'State',
                          ),

                          const SizedBox(
                            height: 20,
                          ),
                          TextFormFieldUnderline(
                            padding: EdgeInsets.all(10),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please Enter City";
                              } else {
                                return null;
                              }
                            },
                            controller: controller.pinCode.value,
                            keyboardType: TextInputType.number,
                            textStyle: TextStylesCustom.textStyles_20,
                            hintText: '302020',
                            labelText: 'Pincode',
                          ),

                          const SizedBox(
                            height: 20,
                          ),

                          DropdownButtonFormField(
                              style: TextStylesCustom.textStyles_20
                                  .apply(color: ColorStyle.secondaryColorgrey),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'please select address type';
                                } else {
                                  return null;
                                }
                              },
                              hint: const Text(
                                'Address Type',
                                style: TextStyle(fontSize: 20),
                              ),
                              items: const [
                                DropdownMenuItem(
                                  value: 'home',
                                  child: Text('home'),
                                ),
                                DropdownMenuItem(
                                  value: 'work',
                                  child: Text('work'),
                                )
                              ],
                              onChanged: (value) {
                                controller.addresTypeFunction(value);
                                // setState(() {
                                //   addresType = value;
                                // });
                              }),
                          const SizedBox(
                            height: 20,
                          ),

                          // ElevatedButton(
                          //   onPressed: () {
                          //     usercontroller.getUserDetails();
                          //     // Validate returns true if the form is valid, or false otherwise.
                          //     if (_formKey.currentState!.validate()) {
                          //       // addaddressApi.addNewAddress({
                          //       //   // "is_deleted": true,
                          //       //   // "full_name": "string",
                          //       //   "phone_num": phoneNumber.text,
                          //       //   "building_num_name": buildingNumber.text,
                          //       //   "area_colony": area.text,
                          //       //   "landmark": landmark.text,
                          //       //   "pincode": int.parse(pincode.text),
                          //       //   "city": city.text,
                          //       //   "state": state.text,
                          //       //   "address_type": addresType,
                          //       //   "user": 1
                          //       // });
                          //       Navigator.pop(context);
                          //     }
                          //   },
                          //   child: const Text('Add address'),
                          // ),
                        ],
                      ),
                    )),
              ),
            ),
          ),
        )
        // }
        // )

        );
    //   },
    // )

    // // ),
    // );
  }
}
