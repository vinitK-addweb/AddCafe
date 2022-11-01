import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:provider/provider.dart';
import 'package:addcafe/Providers/apis/addAddressApi.dart';

class AddNewAddress extends StatefulWidget {
  const AddNewAddress({super.key});

  @override
  State<AddNewAddress> createState() => _AddNewAddressState();
}

class _AddNewAddressState extends State<AddNewAddress> {
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
    final addaddressApi = Provider.of<AddaddressApi>(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: DraggableScrollableSheet(
        initialChildSize: 0.7,
        maxChildSize: 0.9,
        minChildSize: 0.5,
        builder: (_, controller) => ClipRRect(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          child: SingleChildScrollView(
            child: Container(
              color: Colors.white,
              child: Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormField(
                          controller: phoneNumber,
                          obscureText: true,
                          decoration: InputDecoration(
                              labelText: 'Phone Number',
                              labelStyle: TextStyle(fontSize: 20)),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            } else {
                              return null;
                            }
                          },
                        ),
                        TextFormField(
                          controller: buildingNumber,
                          obscureText: true,
                          decoration: InputDecoration(
                              labelText: 'building Name/Number',
                              labelStyle: TextStyle(fontSize: 20)),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            // else if (passwordController.text !=
                            //     confirmPasswordController.text) {
                            //   return 'Password mismatch';
                            // }
                            else {
                              return null;
                            }
                          },
                        ),
                        TextFormField(
                          controller: area,
                          obscureText: true,
                          decoration: InputDecoration(
                              labelText: 'Area',
                              labelStyle: TextStyle(fontSize: 20)),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            } else {
                              return null;
                            }
                          },
                        ),
                        TextFormField(
                          controller: landmark,
                          obscureText: true,
                          decoration: InputDecoration(
                              labelText: 'Landmark',
                              labelStyle: TextStyle(fontSize: 20)),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            } else {
                              return null;
                            }
                          },
                        ),
                        TextFormField(
                          controller: city,
                          obscureText: true,
                          decoration: InputDecoration(
                              labelText: 'City',
                              labelStyle: TextStyle(fontSize: 20)),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            } else {
                              return null;
                            }
                          },
                        ),
                        TextFormField(
                          controller: state,
                          obscureText: true,
                          decoration: InputDecoration(
                              labelText: 'State',
                              labelStyle: TextStyle(fontSize: 20)),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            } else {
                              return null;
                            }
                          },
                        ),
                        TextFormField(
                          controller: pincode,
                          keyboardType: TextInputType.number,
                          obscureText: true,
                          decoration: InputDecoration(
                              labelText: 'Pincode',
                              labelStyle: TextStyle(fontSize: 20)),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            } else {
                              return null;
                            }
                          },
                        ),
                        DropdownButtonFormField(
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
                            // Validate returns true if the form is valid, or false otherwise.
                            if (_formKey.currentState!.validate()) {
                              addaddressApi.addNewAddress({
                                // "is_deleted": true,
                                // "full_name": "string",
                                "phone_num": phoneNumber.text,
                                "building_num_name": buildingNumber.text,
                                "area_colony": area.text,
                                "landmark": landmark.text,
                                "pincode": int.parse(pincode.text),
                                "city": city.text,
                                "state": state.text,
                                "address_type": addresType,
                                "user": 1
                              });
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
