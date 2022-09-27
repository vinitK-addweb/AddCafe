import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomerReviews extends StatelessWidget {
  CustomerReviews({Key? key}) : super(key: key);

  final List customerReviews = <Map>[
    {
      'name': 'James Cook',
      'extra': 'Teacher',
      'image': 'customer_1.jpg',
      'comment':
          'Et autem impedit ut tenetur maxime sed sunt atque ea quaerat exercitationem quo nulla maiores. Non sint labore et quod necessitatibus et voluptas quaerat vel quia mollitia.',
      'date': DateTime.now()
    },
    {
      'name': 'Alisa Wender',
      'extra': 'User',
      'image': 'customer_2.jpg',
      'comment':
          'Et autem impedit ut tenetur maxime sed sunt atque ea quaerat exercitationem quo nulla maiores. Non sint labore et quod necessitatibus et voluptas quaerat vel quia mollitia.',
      'date': DateTime.now()
    },
    {
      'name': 'Robert Real',
      'extra': 'Vendor',
      'image': 'customer_3.jpg',
      'comment':
          'Et autem impedit ut tenetur maxime sed sunt atque ea quaerat exercitationem quo nulla maiores. Non sint labore et quod necessitatibus et voluptas quaerat vel quia mollitia.',
      'date': DateTime.now()
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          'Customer Reviews',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        Column(
            children: customerReviews.map((e) {
          return Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(100))),
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Card(
              color: Colors.transparent,
              child: Column(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage:
                            AssetImage('assets/images/${e['image']}'),
                        radius: 40,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 23),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              e['name'],
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            Text(
                              e['extra'],
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              DateFormat.yMMMd().format(e['date']).toString(),
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    padding: EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                        border: Border(top: BorderSide(color: Colors.grey))),
                    child: Column(
                      children: [
                        Text(
                          e['comment'],
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        }).toList())
      ]),
    );
  }
}
