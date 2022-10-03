import 'package:flutter/material.dart';

class Cart extends StatelessWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
            padding: EdgeInsets.all(10),
            child: Row(
            children: [
              Expanded(child: ElevatedButton(child: Text('Add Address', style: TextStyle(fontSize: 20),), onPressed: (){},))
            ],
          ),),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
          SizedBox(height: 50,),
          Column(children: [
            Container(
            margin: EdgeInsets.symmetric(vertical: 20),
            child: Card(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
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
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            'Your Order',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ))
                    ],
                  ),
                  Container(
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                // decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(right: 10),
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
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Tawa Butter Roti',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(
                                              height: 7,
                                            ),
                                            Text(
                                              'Rs. 15',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            )
                                          ]),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Container(
                                      width: 70,
                                      padding: EdgeInsets.all(4),
                                      decoration: BoxDecoration(
                                          border: Border.all(color: Colors.red),
                                          borderRadius: BorderRadius.all(
                                              (Radius.circular(8)))),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Text(
                                            '-',
                                            style: TextStyle(color: Colors.red),
                                          ),
                                          Text('1'),
                                          Text(
                                            '+',
                                            style: TextStyle(color: Colors.red),
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Text('Rs. 15')
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                // decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(right: 10),
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
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Tawa Butter Roti',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(
                                              height: 7,
                                            ),
                                            Text(
                                              'Rs. 15',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            )
                                          ]),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Container(
                                      width: 70,
                                      padding: EdgeInsets.all(4),
                                      decoration: BoxDecoration(
                                          border: Border.all(color: Colors.red),
                                          borderRadius: BorderRadius.all(
                                              (Radius.circular(8)))),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Text(
                                            '-',
                                            style: TextStyle(color: Colors.red),
                                          ),
                                          Text('1'),
                                          Text(
                                            '+',
                                            style: TextStyle(color: Colors.red),
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Text('Rs. 15')
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Text(
                                'Add more items',
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              )
                            ],
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
                  borderRadius: BorderRadius.all(Radius.circular(50)),
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
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            'Bill Summary',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
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
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Item Total', style: TextStyle(fontWeight: FontWeight.bold),),
                                    Text('Rs. 175.00', style: TextStyle(fontWeight: FontWeight.bold),)
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(5),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Delivery Charge', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),),
                                    Text('FREE', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),)
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(5),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Govt. taxes', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),),
                                    Text('Rs. 8.75', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),)
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(top: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Grand Total', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                                    Text('Rs. 184.75', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),)
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
          
          ],),
          
        ]),
    ),
    );
  }
}
