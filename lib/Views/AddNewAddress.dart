import 'package:addcafe/Styles/ColorStyle.dart';
import 'package:addcafe/Views/Auth/Password.dart';
import 'package:flutter/material.dart';
import '../Styles/SizeStyle.dart';
import '../Styles/TextStyles.dart';
import '../Components/TextFieldCustom.dart';
import '../GetxController/UserProfile_controller.dart';
// import 'package:intl_phone_number_input/intl_phone_number_input.dart';
// import 'package:provider/provider.dart';
// import 'package:addcafe/Providers/apis/addAddressApi.dart';

class AddNewAddress extends StatefulWidget {
  const AddNewAddress({super.key});

  @override
  State<AddNewAddress> createState() => _AddNewAddressState();
}

class _AddNewAddressState extends State<AddNewAddress> {
  final usercontroller = UserProfileController();
  final _formKey = GlobalKey<FormState>();
  final phoneNumber = TextEditingController();
  final buildingNumber = TextEditingController();
  final area = TextEditingController();
  final landmark = TextEditingController();
  final city = TextEditingController();
  final state = TextEditingController();
  final pincode = TextEditingController();
  String? addresType = '';
  @override
  Widget build(BuildContext context) {
    // final addaddressApi = Provider.of<AddaddressApi>(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: DraggableScrollableSheet(
        initialChildSize: 0.7,
        maxChildSize: 0.9,
        minChildSize: 0.5,
        builder: (_, controller) => ClipRRect(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          child: SingleChildScrollView(
            // physics: NeverScrollableScrollPhysics(),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              color: Colors.white,
              child: Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Add New Address',
                          style: TextStylesCustom.textStyles_40
                              .apply(fontSizeDelta: 4),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        TextFieldUnderline(
                          textStyle: TextStylesCustom.textStyles_20,
                          hintText: '9123456789',
                          labelText: 'Phone Number',
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFieldUnderline(
                          textStyle: TextStylesCustom.textStyles_20,
                          hintText: 'arihant villa',
                          labelText: 'Building Name/Number',
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFieldUnderline(
                          textStyle: TextStylesCustom.textStyles_20,
                          hintText: 'Mansrover',
                          labelText: 'Area',
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFieldUnderline(
                          textStyle: TextStylesCustom.textStyles_20,
                          hintText: 'New Sanganer Road',
                          labelText: 'Land Mark',
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFieldUnderline(
                          textStyle: TextStylesCustom.textStyles_20,
                          hintText: 'Jaipur',
                          labelText: 'City',
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFieldUnderline(
                          textStyle: TextStylesCustom.textStyles_20,
                          hintText: 'Rajasthan',
                          labelText: 'State',
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFieldUnderline(
                          textStyle: TextStylesCustom.textStyles_20,
                          hintText: '302020',
                          labelText: 'Pincode',
                        ),

                        // TextFormField(
                        //   controller: phoneNumber,
                        //   obscureText: true,
                        //   decoration: InputDecoration(
                        //       labelText: 'Phone Number',
                        //       labelStyle: TextStyle(fontSize: 20)),
                        //   validator: (value) {
                        //     if (value == null || value.isEmpty) {
                        //       return 'Please enter some text';
                        //     } else {
                        //       return null;
                        //     }
                        //   },
                        // ),
                        // TextFormField(
                        //   controller: buildingNumber,
                        //   obscureText: true,
                        //   decoration: InputDecoration(
                        //       labelText: 'building Name/Number',
                        //       labelStyle: TextStyle(fontSize: 20)),
                        //   validator: (value) {
                        //     if (value == null || value.isEmpty) {
                        //       return 'Please enter some text';
                        //     } else {
                        //       return null;
                        //     }
                        //   },
                        // ),
                        // TextFormField(
                        //   controller: area,
                        //   obscureText: true,
                        //   decoration: InputDecoration(
                        //       labelText: 'Area',
                        //       labelStyle: TextStyle(fontSize: 20)),
                        //   validator: (value) {
                        //     if (value == null || value.isEmpty) {
                        //       return 'Please enter some text';
                        //     } else {
                        //       return null;
                        //     }
                        //   },
                        // ),
                        // TextFormField(
                        //   controller: landmark,
                        //   obscureText: true,
                        //   decoration: InputDecoration(
                        //       labelText: 'Landmark',
                        //       labelStyle: TextStyle(fontSize: 20)),
                        //   validator: (value) {
                        //     if (value == null || value.isEmpty) {
                        //       return 'Please enter some text';
                        //     } else {
                        //       return null;
                        //     }
                        //   },
                        // ),
                        // TextFormField(
                        //   controller: city,
                        //   obscureText: true,
                        //   decoration: InputDecoration(
                        //       labelText: 'City',
                        //       labelStyle: TextStyle(fontSize: 20)),
                        //   validator: (value) {
                        //     if (value == null || value.isEmpty) {
                        //       return 'Please enter some text';
                        //     } else {
                        //       return null;
                        //     }
                        //   },
                        // ),
                        // TextFormField(
                        //   controller: state,
                        //   obscureText: true,
                        //   decoration: InputDecoration(
                        //       labelText: 'State',
                        //       labelStyle: TextStyle(fontSize: 20)),
                        //   validator: (value) {
                        //     if (value == null || value.isEmpty) {
                        //       return 'Please enter some text';
                        //     } else {
                        //       return null;
                        //     }
                        //   },
                        // ),
                        // TextFormField(
                        //   controller: pincode,
                        //   keyboardType: TextInputType.number,
                        //   obscureText: true,
                        //   decoration: InputDecoration(
                        //       labelText: 'Pincode',
                        //       labelStyle: TextStyle(fontSize: 20)),
                        //   validator: (value) {
                        //     if (value == null || value.isEmpty) {
                        //       return 'Please enter some text';
                        //     } else {
                        //       return null;
                        //     }
                        //   },
                        // ),
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
                              setState(() {
                                addresType = value;
                              });
                            }),
                        ElevatedButton(
                          onPressed: () {
                            usercontroller.getUserDetails();
                            // Validate returns true if the form is valid, or false otherwise.
                            if (_formKey.currentState!.validate()) {
                              // addaddressApi.addNewAddress({
                              //   // "is_deleted": true,
                              //   // "full_name": "string",
                              //   "phone_num": phoneNumber.text,
                              //   "building_num_name": buildingNumber.text,
                              //   "area_colony": area.text,
                              //   "landmark": landmark.text,
                              //   "pincode": int.parse(pincode.text),
                              //   "city": city.text,
                              //   "state": state.text,
                              //   "address_type": addresType,
                              //   "user": 1
                              // });
                              Navigator.pop(context);
                            }
                          },
                          child: const Text('Add address'),
                        ),
                      ],
                    ),
                  )),
            ),
          ),
        ),
      ),
    );
  }
}
