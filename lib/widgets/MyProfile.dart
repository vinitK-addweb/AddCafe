import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:addcafe/Providers/apis/UserOrderApi.dart';
import 'package:addcafe/Providers/apis/addAddressApi.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import './auth/UpdatePassword.dart';
import './auth/AddNewAddress.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override
  Widget build(BuildContext context) {
    final userOrderApi = Provider.of<UserOrderApi>(context);
    final addaddressApi = Provider.of<AddaddressApi>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('MyProfile'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
          child: Container(
        padding: EdgeInsets.only(top: 20),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTWVCMqc3YEMQ2gr0kKUGFXy17lU5OL_nZ3n1Jl4Omy&s'),
              radius: 60,
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              child: Text(
                'abc.abc@gamil.com',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                textAlign: TextAlign.center,
              ),
            ),

            //order history start ....................................
            Container(
              width: double.infinity,
              padding: EdgeInsets.only(left: 10),
              child: Text(
                'Order History',
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.green,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Column(
                children: [
                  ...userOrderApi.userOrder.map(
                    (e) {
                      return Card(
                        child: Container(
                          padding: EdgeInsets.only(left: 20, bottom: 10),
                          child: Column(children: [
                            ...e['product'].map((item) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 20),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 120,
                                      height: 100,
                                      child: Image(
                                        image: NetworkImage(
                                            '${dotenv.env['IMG_URL']}/${item['product_detail']['featured_image']}'),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Container(
                                      width: 230,
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              padding: EdgeInsets.all(4),
                                              child: Text(
                                                item['product_detail']
                                                    ['item_name'],
                                                style: TextStyle(fontSize: 16),
                                              ),
                                            ),
                                            Container(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Container(
                                                    padding: EdgeInsets.all(4),
                                                    child: Text(
                                                        'Quantity-${item['quantity']}',
                                                        style: TextStyle(
                                                            fontSize: 16)),
                                                  ),
                                                  Container(
                                                    padding: EdgeInsets.all(4),
                                                    child: Text(
                                                        'Rs. ${item['price']}'),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ]),
                                    )
                                  ],
                                ),
                              );
                            }),
                            Container(
                              width: double.infinity,
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: Text(
                                'Total Cost: Rs. ${e['order_total_cost']}',
                                style: TextStyle(fontSize: 17),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(right: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  ElevatedButton(
                                    onPressed: () {},
                                    child: Row(
                                      children: [
                                        Icon(Icons.replay),
                                        SizedBox(
                                          width: 2,
                                        ),
                                        Text('Repeat'),
                                      ],
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            12), // <-- Radius
                                      ),
                                    ),
                                  ),
                                  OutlinedButton(
                                    onPressed: () {},
                                    child: Row(
                                      children: [
                                        Icon(Icons.file_download),
                                        SizedBox(
                                          width: 2,
                                        ),
                                        Text('Invoice'),
                                      ],
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            12), // <-- Radius
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ]),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            // order history end....................................

            //update password start.................................
            Container(
              width: double.infinity,
              padding: EdgeInsets.only(left: 10),
              margin: EdgeInsets.only(top: 30),
              child: Text(
                'Update Password',
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.green,
                    fontWeight: FontWeight.bold),
              ),
            ),
            UpdatePasswordForm(),
            //update password end.....................................

            //saved address start......................................
            Container(
              width: double.infinity,
              padding: EdgeInsets.only(left: 10),
              margin: EdgeInsets.only(top: 30),
              child: Text(
                'Saved address',
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.green,
                    fontWeight: FontWeight.bold),
              ),
            ),
            ...addaddressApi.savedAddressData.map(
              (e) {
                return Container(
                  width: double.infinity,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8),
                          child: Row(children: [
                            Icon(
                              Icons.location_on,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.8,
                              padding: EdgeInsets.all(8),
                              child: Text(
                                  '${e['building_num_name']}, ${e['area_colony']}, ${e['landmark']}, ${e['city']}, ${e['state']}, ${e['pincode']}'),
                            )
                          ]),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8),
                          child: Row(children: [
                            Icon(
                              Icons.phone,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('${e['phone_num']}'),
                            )
                          ]),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8),
                          child: Row(children: [
                            e['address_type'] == 'home'
                                ? Icon(
                                    Icons.home,
                                  )
                                : Icon(
                                    Icons.work,
                                  ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('${e['address_type']}'),
                            )
                          ]),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8),
                          child: Row(children: [
                            Padding(
                              padding: const EdgeInsets.all(0),
                              child: TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    'Edit',
                                    style: TextStyle(color: Colors.green),
                                  )),
                            ),
                            Container(
                              height: 15,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black)),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(0),
                              child: TextButton(
                                  onPressed: () {
                                    addaddressApi.deleteAddress(e['id']);
                                  },
                                  child: Text(
                                    'Delete',
                                    style: TextStyle(color: Colors.green),
                                  )),
                            ),
                          ]),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 5,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.black, width: 0.2)),
                          ),
                        )
                      ]),
                );
              },
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(20))),
                            context: context,
                            builder: (context) => AddNewAddress());
                      },
                      child: Text('Add new address')),
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
