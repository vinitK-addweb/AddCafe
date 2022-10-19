import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:addcafe/Providers/apis/CartApi.dart';
import 'package:addcafe/Providers/apis/addAddressApi.dart';
import '../cart/emptyCart.dart';

class AddAddress extends StatelessWidget {
  const AddAddress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartApi = Provider.of<CartApi>(context);
    final addaddressApi = Provider.of<AddaddressApi>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout'),
        centerTitle: true,
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(10),
        child: Row(
          children: [
            Expanded(
                child: ElevatedButton(
              child: Text(
                'proceed to payment',
                style: TextStyle(fontSize: 20),
              ),
              onPressed: addaddressApi.selectedAddress == 0 ? null : () {},
            ))
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              cartApi.cartData.isEmpty
                  ? EmptyCart()
                  : Column(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 20),
                          child: Card(
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50)),
                              ),
                              child: Column(children: [
                                Row(
                                  children: [
                                    Container(
                                      width: 3,
                                      height: 20,
                                      color: Colors.red,
                                    ),
                                    Container(
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: Text(
                                          'Your Order',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ))
                                  ],
                                ),
                                Container(
                                  child: Column(
                                    children: [
                                      ...cartApi.cartData.map(
                                        (e) {
                                          return Container(
                                            padding: EdgeInsets.all(10),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Container(
                                                  // decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                                                  child: Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Container(
                                                        margin: EdgeInsets.only(
                                                            right: 10),
                                                        width: 20,
                                                        child: Image(
                                                          image: AssetImage(
                                                              'assets/images/vegIcon.png'),
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                      Container(
                                                        child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                e['item_detail']
                                                                    [
                                                                    'item_name'],
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                              ),
                                                              ...e['added_addon']
                                                                  .map((addon) =>
                                                                      Text(
                                                                          '${addon['addon_name']}  ${addon['addon_price']}'))
                                                                  .toList(),
                                                              SizedBox(
                                                                height: 7,
                                                              ),
                                                              Text(
                                                                'Rs. ${e['item_detail']['price']}',
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                              )
                                                            ]),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    children: [
                                                      Container(
                                                        width: 70,
                                                        padding:
                                                            EdgeInsets.all(4),
                                                        decoration:
                                                            BoxDecoration(
                                                                // border: Border.all(
                                                                //     color:
                                                                //         Colors.red,),
                                                                borderRadius: BorderRadius
                                                                    .all((Radius
                                                                        .circular(
                                                                            8)))),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceAround,
                                                          children: [
                                                            Text(
                                                                '${e['item_count']}'),
                                                          ],
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 8,
                                                      ),
                                                      Text(
                                                          'Rs. ${e['total_price']}')
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Container(
                                          padding: EdgeInsets.all(10),
                                          child: Row(
                                            children: [
                                              Text(
                                                'Add more items',
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ]),
                            ),
                          ),
                        ),
                        Container(
                          // margin: EdgeInsets.symmetric(vertical: 5),
                          child: Card(
                            elevation: 0,
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50)),
                              ),
                              child: Column(children: [
                                Row(
                                  children: [
                                    Container(
                                      width: 3,
                                      height: 20,
                                      color: Colors.red,
                                    ),
                                    Container(
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: Text(
                                          'Add Address',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ))
                                  ],
                                ),
                                Container(
                                  child: Column(
                                    children: [
                                      ...addaddressApi.savedAddressData.map(
                                        (e) {
                                          return Container(
                                            padding: EdgeInsets.all(10),
                                            child: Card(
                                              elevation: addaddressApi
                                                          .selectedAddress ==
                                                      e['id']
                                                  ? 10
                                                  : 1,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    padding: EdgeInsets.all(5),
                                                    child: Row(
                                                      children: [
                                                        Icon(
                                                          e['address_type'] ==
                                                                  'home'
                                                              ? Icons.home
                                                              : Icons.work,
                                                          size: 50,
                                                          color: Colors.green,
                                                        ),
                                                        Text(
                                                          e['address_type'] ==
                                                                  'home'
                                                              ? 'Home'
                                                              : 'Work',
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 18,
                                                              color:
                                                                  Colors.green),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 15,
                                                            vertical: 5),
                                                    child: Text(
                                                      e['building_num_name'],
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 15,
                                                            vertical: 5),
                                                    child: Text(
                                                      e['area_colony'],
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 15,
                                                            vertical: 5),
                                                    child: Text(
                                                      '${e['city']}( ${e['pincode']} )',
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 15,
                                                            vertical: 5),
                                                    child: Text(
                                                      e['state'],
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 15),
                                                    child: ElevatedButton(
                                                        onPressed: () {
                                                          addaddressApi
                                                              .setAddress(
                                                                  e['id']);
                                                        },
                                                        child: Text(
                                                            'Deliver Here')),
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  )
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                      //address containers...........................
                                    ],
                                  ),
                                )
                              ]),
                            ),
                          ),
                        ),
                      ],
                    ),
            ]),
      ),
    );
  }
}
