// import '../Models/Model_MyHomePage.dart';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';

// class CustomerReviews extends StatelessWidget {
//   CustomerReviews(this.customerReviews);
//   final List<ModelCustomerReviews> customerReviews;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
//       child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//         Text(
//           'Customer Reviews',
//           style: TextStyle(fontWeight: FontWeight.bold),
//         ),
//         Column(
//             children: customerReviews.map((e) {
//           return Container(
//             margin: EdgeInsets.symmetric(vertical: 10),
//             child: Card(
//               child: Column(
//                 children: [
//                   Row(
//                     children: [
//                       CircleAvatar(
//                         backgroundImage: NetworkImage(e.image!),
//                         radius: 40,
//                       ),
//                       Container(
//                         margin: EdgeInsets.only(left: 23),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               e.name!,
//                               style: TextStyle(fontWeight: FontWeight.bold),
//                             ),
//                             Text(
//                               e.extra!,
//                               style: TextStyle(color: Colors.grey[600]),
//                             ),
//                             Text(
//                               DateFormat.yMMMd()
//                                   .format(DateTime.now())
//                                   .toString(),
//                               style: TextStyle(color: Colors.grey[600]),
//                             )
//                           ],
//                         ),
//                       )
//                     ],
//                   ),
//                   Container(
//                     margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
//                     padding: EdgeInsets.symmetric(vertical: 10),
//                     decoration: BoxDecoration(
//                         border: Border(top: BorderSide(color: Colors.grey))),
//                     child: Column(
//                       children: [Text(e.comment!)],
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           );
//         }).toList())
//       ]),
//     );
//   }
// }
