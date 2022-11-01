import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:addcafe/Providers/apis/CartApi.dart';
import 'package:provider/provider.dart';
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
  // get product {
  //   return productData;
  // }
  // List checkboxValues = product['add_on_data'].map(e => {

  // });
  List productAddOn = [];
  double total = 0;

  final values = {
    'value1': false,
    'value2': false,
    'value3': false,
    'value4': false,
    'value5': false,
  };
  var quantity = 1;
// decrease the item from cart

  void _addQuantity(int index) {
    setState(() {
      quantity++;
      //  _quantityController[index].text = '$quantity';
    });
  }

//productdat price
  // get total {
  //   var price = 0;
  //   var count = 0;
  //   values.forEach((key, value) {
  //     (values as List).indexOf(value);
  //     if(value){
  //       price += productData['']
  //     }
  //   });
  // }

  // addAddon(){

  // }

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
    final cartApi = Provider.of<CartApi>(context, listen: false);
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
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.red),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        )),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'Rs.${total != 0 ? total : productData['price']}',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                height: 50,
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: ElevatedButton(
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)))),
                    onPressed: (() {
                      cartApi.addToCart(
                          {'item': productData['id'], "addon": productAddOn});
                      Navigator.pop(context);
                    }),
                    child: const Text(
                      'Add item',
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
                                    '${productData["featured_image"]}'),
                              )),
                          // -------------------------------product title----------------------------
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 10),
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
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              children: [
                                Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.red,
                                        ),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(8))),
                                    child: Rating(4)),
                                const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    '56 reviews',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
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
                            margin: const EdgeInsets.symmetric(horizontal: 10),
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
                                    child:
                                        const Text('Select up to 2 options')),
                                Column(
                                  children: [
                                    ...(productData['add_on_data']).map((e) {
                                      var i =
                                          productData['add_on_data'].indexOf(e);
                                      return Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text(
                                            e['addon_name'],
                                            style: TextStyle(fontSize: 17.0),
                                          ), //Text
                                          const SizedBox(width: 10), //SizedBox
                                          /** Checkbox Widget **/
                                          Row(
                                            children: [
                                              Text('₹${e['addon_price']}'),
                                              Checkbox(
                                                value:
                                                    values['value${(i + 1)}'],
                                                onChanged: (value) {
                                                  setState(() {
                                                    if (value == true) {
                                                      values['value${(i + 1)}'] =
                                                          true;
                                                      productAddOn.add(e['id']);
                                                      if (total == 0) {
                                                        total = productData[
                                                                'price'] +
                                                            e['addon_price'];
                                                      } else {
                                                        total = total +
                                                            e['addon_price'];
                                                      }
                                                    } else {
                                                      values['value${(i + 1)}'] =
                                                          false;
                                                      productAddOn
                                                          .remove(e['id']);
                                                      total = total -
                                                          e['addon_price'];
                                                    }
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
              ),
            ),
          ),
        ),
      ),
    );
  }
}
