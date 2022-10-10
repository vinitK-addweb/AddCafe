import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import './rating.dart';

class Addon extends StatefulWidget {
  Addon(this.productData);
  final productData;

  @override
  State<Addon> createState() => _AddonState(productData);
}

class _AddonState extends State<Addon> {
  _AddonState(this.productData);
  final productData;

  final values = {
    'value1': false,
    'value2': false,
    'value3': false,
  };
  var quantity = 1;
// decrease the item from cart

  void _addQuantity(int index) {
    setState(() {
      quantity++;
      //  _quantityController[index].text = '$quantity';
    });
  }

// add the item in cart
  void _removeQuantity(int index) {
    setState(() {
      if (quantity > 0) {
        quantity--;
      } else {
        quantity = 0;
      }
      //  _quantityController[index].text = '$quantity';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      // ----------bottom bar---------------------
      bottomNavigationBar: Container(
        color: Colors.white,
        height: 100,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Center(
                child: SizedBox(
                  // width: 1,
                  height: 50,
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.red),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        )),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        // ignore: prefer_const_constructors
                        IconButton(
                          onPressed: () {
                            _removeQuantity(quantity);
                          },
                          icon: Icon(
                            Icons.remove,
                            color: Colors.red,
                            size: 30,
                          ),
                        ),
                        //       Container(
                        //     width: 60.0,
                        //     padding: const EdgeInsets.only(left: 1.0, right: 1.0),
                        //     child: Center(
                        //       child: TextField(
                        //         textAlign: TextAlign.center,
                        //         decoration: new InputDecoration(
                        //           hintText: "1",
                        //         ),
                        //         keyboardType: TextInputType.number,
                        //         controller: _quantityController[index],
                        //       ),
                        //     )
                        // ),

                        Text(
                          '${quantity}',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                        IconButton(
                          onPressed: () {
                            _addQuantity(quantity);
                          },
                          icon: Icon(
                            Icons.add,
                            color: Colors.red,
                            size: 30,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                height: 50,
                // width: 100,
                // decoration:
                //     BoxDecoration(borderRadius: BorderRadius.circular(20)),
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: ElevatedButton(
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)))),
                    onPressed: (() {}),
                    child: const Text(
                      'Add item - ₹50',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    )),
              )
            ],
          ),
        ),
      ),
      body: DraggableScrollableSheet(
          initialChildSize: 0.7,
          maxChildSize: 0.9,
          minChildSize: 0.5,
          builder: (_, controller) => ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              child: Container(
                  width: double.infinity,
                  color: Colors.white,
                  child: Container(
                      child: ListView(
                    children: [
                      Column(mainAxisSize: MainAxisSize.min, children: [
                        Column(
                          children: [
                            Card(
                                child: Column(children: [
                              Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Image.network(
                                        productData['featured_image']),
                                  )),
                              // -------------------------------product title----------------------------
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Row(
                                  children: [
                                    Text(
                                      productData['item_name'],
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.grey,
                                          ),
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(20))),
                                      child: const Padding(
                                        padding: EdgeInsets.all(5.0),
                                        child: Icon(
                                          Icons.favorite_border_outlined,
                                          color: Colors.red,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.grey,
                                          ),
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(20))),
                                      child: const Padding(
                                        padding: EdgeInsets.all(5.0),
                                        child: Icon(
                                          Icons.share_outlined,
                                          color: Colors.red,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              //------------- product reatings--------------------
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Row(
                                  children: [
                                    Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Colors.red,
                                            ),
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(8))),
                                        child: Rating(4)),
                                    const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
                                        '56 reviews',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                child: Text(productData['description']),
                              )
                            ])),
                            Card(
                              child: Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Column(
                                  children: [
                                    Container(
                                        width: double.infinity,
                                        child: const Text(
                                          'Add On',
                                          style: TextStyle(
                                              fontSize: 22,
                                              fontWeight: FontWeight.bold),
                                        )),
                                    Container(
                                        width: double.infinity,
                                        child: const Text(
                                            'Select up to 2 options')),
                                    Column(
                                      children: [
                                        ...(productData['add_on_data'])
                                            .map((e) {
                                          return Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              // SizedBox(
                                              //   width: 10,
                                              // ),
                                              Text(
                                                e['addon_name'],
                                                style:
                                                    TextStyle(fontSize: 17.0),
                                              ), //Text
                                              const SizedBox(
                                                  width: 10), //SizedBox
                                              /** Checkbox Widget **/
                                              Row(
                                                children: [
                                                  Text('₹${e['addon_price']}'),
                                                  Checkbox(
                                                    value:
                                                        this.values['value1'],
                                                    onChanged: (value) {
                                                      setState(() {
                                                        this.values['value1'] =
                                                            value!;
                                                      });
                                                    },
                                                  ),
                                                ],
                                              ), ////Checkbox
                                            ], //<Widget>[]
                                          );
                                        })
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        )
                      ]),
                    ],
                  ))))),
    );
  }

  // radius(int i) {}
}

// Widget Addon() => Column(
//       children: [
//         Text(
//             'Views Filter Object is a Drupal module which allows content creators to configure a view via the standard editing interface for any entity. It works particularly well with Paragraphs.')
//       ],
//     );
