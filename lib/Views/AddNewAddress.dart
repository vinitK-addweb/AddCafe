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
  const AddNewAddress({super.key, this.isAddress = true});

  final bool? isAddress;

  @override
  Widget build(BuildContext context) {
    final controller = UserProfileController();
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
      body: ClipRRect(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30), topRight: Radius.circular(30)),
        child: SingleChildScrollView(
          // physics: NeverScrollableScrollPhysics(),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 15),
            color: Colors.white,
            child: Form(
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
                  TextFieldUnderline(
                    controller: controller.phoneNumber.value,
                    textStyle: TextStylesCustom.textStyles_20,
                    hintText: '9123456789',
                    labelText: 'Phone Number',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFieldUnderline(
                    controller: controller.buildingNameNo.value,
                    textStyle: TextStylesCustom.textStyles_20,
                    hintText: 'arihant villa',
                    labelText: 'Building Name/Number',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFieldUnderline(
                    controller: controller.area.value,
                    textStyle: TextStylesCustom.textStyles_20,
                    hintText: 'Mansrover',
                    labelText: 'Area',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFieldUnderline(
                    controller: controller.landMark.value,
                    textStyle: TextStylesCustom.textStyles_20,
                    hintText: 'New Sanganer Road',
                    labelText: 'Land Mark',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFieldUnderline(
                    controller: controller.city.value,
                    textStyle: TextStylesCustom.textStyles_20,
                    hintText: 'Jaipur',
                    labelText: 'City',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFieldUnderline(
                    controller: controller.state.value,
                    textStyle: TextStylesCustom.textStyles_20,
                    hintText: 'Rajasthan',
                    labelText: 'State',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFieldUnderline(
                    controller: controller.pinCode.value,
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
                      hint: Text(
                        'Address Type',
                        style: TextStyle(fontSize: 20),
                      ),
                      items: [
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
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButtonCustom(
                    radiusBorder: 50,
                    BgColor: ColorStyle.primaryColorRed,
                    onTap: () {
                      isAddress!
                          ? controller.addNewAddress()
                          : controller.updateAddress();
                    },
                    size: Size(MediaQuery.of(context).size.width, 50),
                    text: isAddress! ? '+ Add Address' : 'Update Address',
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
      // ),
    );
  }
}
