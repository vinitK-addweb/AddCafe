import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:addcafe/Providers/apis/CartApi.dart';
import './emptyCart.dart';

class Cart extends StatelessWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartApi = Provider.of<CartApi>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
        centerTitle: true,
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(20),
        child: Row(
          children: [
            Expanded(
                child: MaterialButton(
              height: 55,
              minWidth: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              color: Colors.red,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Text(
                cartApi.cartData.isNotEmpty
                    ? 'Proceed to checkout'
                    : 'Add Items',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              onPressed: () {
                cartApi.cartData.isNotEmpty
                    ? Navigator.of(context).pushNamed('/addAddress')
                    : Navigator.of(context).pushNamed('/');
              },
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
                                                        decoration: BoxDecoration(
                                                            border: Border.all(
                                                                color:
                                                                    Colors.red),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .all((Radius
                                                                        .circular(
                                                                            8)))),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceAround,
                                                          children: [
                                                            InkWell(
                                                              onTap: () {
                                                                if (e['item_count'] ==
                                                                    1) {
                                                                  cartApi.delete(
                                                                      e['id']);
                                                                  return;
                                                                }
                                                                cartApi
                                                                    .updateQuantity(
                                                                        'minus',
                                                                        e['id']);
                                                              },
                                                              child: Container(
                                                                width: 20,
                                                                child: Center(
                                                                  child: Text(
                                                                    '-',
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .red),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Text(
                                                                '${e['item_count']}'),
                                                            InkWell(
                                                              onTap: () {
                                                                cartApi
                                                                    .updateQuantity(
                                                                        'plus',
                                                                        e['id']);
                                                              },
                                                              child: Container(
                                                                width: 20,
                                                                child: Center(
                                                                  child: Text(
                                                                    '+',
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .red),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
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
                                          'Bill Summary',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ))
                                  ],
                                ),
                                Container(
                                  child: Column(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(10),
                                        child: Column(
                                          children: [
                                            Container(
                                              padding: EdgeInsets.all(5),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    'Item Total',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Text(
                                                    'Rs. ${cartApi.cart['total_rate']}',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Container(
                                              padding: EdgeInsets.all(5),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    'Delivery Charge',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.blue),
                                                  ),
                                                  Text(
                                                    'FREE',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.blue),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Container(
                                              padding: EdgeInsets.all(5),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    'Govt. taxes',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.grey),
                                                  ),
                                                  Text(
                                                    'Rs. 8.75',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.grey),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Container(
                                              padding: EdgeInsets.only(top: 10),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    'Grand Total',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 18),
                                                  ),
                                                  Text(
                                                    'Rs. ${cartApi.cart['total_rate']}',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 18),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
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
