import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomerReviews extends StatelessWidget {
  // CustomerReviews({ Key? key }) : super(key: key);

  CustomerReviews(this.customerReviews);
  final List customerReviews;

  // final List customerReviews = <Map>[
  //   {
  //     'name': 'James Cook',
  //     'extra': 'Teacher',
  //     'image': 'customer_1.jpg',
  //     'comment':
  //         'Et autem impedit ut tenetur maxime sed sunt atque ea quaerat exercitationem quo nulla maiores. Non sint labore et quod necessitatibus et voluptas quaerat vel quia mollitia.',
  //     'date': DateTime.now()
  //   },
  //   {
  //     'name': 'Alisa Wender',
  //     'extra': 'User',
  //     'image': 'customer_2.jpg',
  //     'comment':
  //         'Et autem impedit ut tenetur maxime sed sunt atque ea quaerat exercitationem quo nulla maiores. Non sint labore et quod necessitatibus et voluptas quaerat vel quia mollitia.',
  //     'date': DateTime.now()
  //   },
  //   {
  //     'name': 'Robert Real',
  //     'extra': 'Vendor',
  //     'image': 'customer_3.jpg',
  //     'comment':
  //         'Et autem impedit ut tenetur maxime sed sunt atque ea quaerat exercitationem quo nulla maiores. Non sint labore et quod necessitatibus et voluptas quaerat vel quia mollitia.',
  //     'date': DateTime.now()
  //   },
  // ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          'Customer Reviews',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Column(
            children: customerReviews.map((e) {
          return Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Card(
              child: Column(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(e['image']),
                        radius: 40,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 23),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              e['name'],
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              e['extra'],
                              style: TextStyle(color: Colors.grey[600]),
                            ),
                            Text(
                              DateFormat.yMMMd()
                                  .format(DateTime.now())
                                  .toString(),
                              style: TextStyle(color: Colors.grey[600]),
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
                      children: [Text(e['comment'])],
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
