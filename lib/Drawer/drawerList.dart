import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:addcafe/GetxController/UserAuth_controller.dart';

class MyDrowerList extends StatelessWidget {
  final userAuth = Get.put(UserAuth());
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: UserAuth(),
        initState: (_) {
          userAuth.userprofile;
        },
        builder: (controller) {
          return Container(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                Card(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/');
                      },
                      child: Container(
                        padding: EdgeInsets.all(20.0),
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.home_outlined,
                                size: 30,
                                color: Colors.grey,
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 20),
                                child: Text(
                                  'Home',
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 20),
                                ),
                              ),
                            ]),
                      ),
                    ),
                    InkWell(
                      child: Container(
                        padding: EdgeInsets.all(20.0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.wallet_giftcard,
                                size: 30,
                                color: Colors.grey,
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 20),
                                child: Text(
                                  'Profile',
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 20),
                                ),
                              ),
                            ]),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/Myfavrourits');
                      },
                      child: Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Row(children: [
                          Icon(
                            Icons.favorite_border_outlined,
                            size: 30,
                            color: Colors.grey,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 20),
                            child: Text(
                              'My Favourites',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 20),
                            ),
                          ),
                        ]),
                      ),
                    ),
                    InkWell(
                      child: Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Row(children: [
                          Icon(
                            Icons.discount_outlined,
                            size: 30,
                            color: Colors.grey,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 20),
                            child: Text(
                              'Offers',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 20),
                            ),
                          ),
                        ]),
                      ),
                    ),
                    InkWell(
                      onTap: () => Navigator.pushNamed(context, '/Faq'),
                      child: Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Row(children: [
                          Icon(
                            Icons.question_answer_outlined,
                            size: 30,
                            color: Colors.grey,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 20),
                            child: Text(
                              'Faqs',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 20),
                            ),
                          ),
                        ]),
                      ),
                    ),
                    userAuth.userprofile.isNotEmpty
                        ? Container(
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.symmetric(horizontal: 30),
                            child: ElevatedButton(
                                onPressed: () => userAuth.logOut(),
                                child: Text('Log Out')))
                        : SizedBox(
                            height: 0,
                            child: Text(userAuth.userprofile.isNotEmpty
                                ? 'true'
                                : 'false'),
                          )
                  ],
                )),
                // Card(
                //     child: Column(
                //   crossAxisAlignment: CrossAxisAlignment.start,
                //   children: [
                //     InkWell(
                //       child: Container(
                //         padding: EdgeInsets.all(10.0),
                //         child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                //           Icon(
                //             Icons.map_sharp,
                //             size: 30,
                //             color: Colors.grey,
                //           ),
                //           Container(
                //             margin: EdgeInsets.only(left: 40),
                //             child: Text(
                //               'Track Order',
                //               style: TextStyle(color: Colors.grey, fontSize: 20),
                //             ),
                //           ),
                //         ]),
                //       ),
                //     ),
                //     InkWell(
                //       child: Container(
                //         padding: EdgeInsets.all(10.0),
                //         child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                //           Icon(
                //             Icons.local_pizza_sharp,
                //             size: 30,
                //             color: Colors.grey,
                //           ),
                //           Container(
                //             margin: EdgeInsets.only(left: 40),
                //             child: Text(
                //               'Order History',
                //               style: TextStyle(color: Colors.grey, fontSize: 20),
                //             ),
                //           ),
                //         ]),
                //       ),
                //     ),
                //     InkWell(
                //       child: Padding(
                //         padding: EdgeInsets.all(10.0),
                //         child: Row(children: [
                //           Icon(
                //             Icons.wallet,
                //             size: 30,
                //             color: Colors.grey,
                //           ),
                //           Container(
                //             margin: EdgeInsets.only(left: 40),
                //             child: Text(
                //               'Wallet',
                //               style: TextStyle(color: Colors.grey, fontSize: 20),
                //             ),
                //           ),
                //         ]),
                //       ),
                //     ),
                //   ],
                // )),
                // Card(
                //     child: Column(
                //   crossAxisAlignment: CrossAxisAlignment.start,
                //   children: [
                //     InkWell(
                //       child: Container(
                //         padding: EdgeInsets.all(10.0),
                //         child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                //           Icon(
                //             Icons.language_sharp,
                //             size: 30,
                //             color: Colors.grey,
                //           ),
                //           Container(
                //             margin: EdgeInsets.only(left: 40),
                //             child: Text(
                //               'Change Language',
                //               style: TextStyle(color: Colors.grey, fontSize: 20),
                //             ),
                //           ),
                //         ]),
                //       ),
                //     ),
                //     InkWell(
                //       child: Container(
                //         padding: EdgeInsets.all(10.0),
                //         child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                //           Icon(
                //             Icons.feedback,
                //             size: 30,
                //             color: Colors.grey,
                //           ),
                //           Container(
                //             margin: EdgeInsets.only(left: 40),
                //             child: Text(
                //               'Feedback',
                //               style: TextStyle(color: Colors.grey, fontSize: 20),
                //             ),
                //           ),
                //         ]),
                //       ),
                //     ),
                //     InkWell(
                //       child: Padding(
                //         padding: EdgeInsets.all(10.0),
                //         child: Row(children: [
                //           Icon(
                //             Icons.feed_sharp,
                //             size: 30,
                //             color: Colors.grey,
                //           ),
                //           Container(
                //             margin: EdgeInsets.only(left: 40),
                //             child: Text(
                //               'Terms & Conditions',
                //               style: TextStyle(color: Colors.grey, fontSize: 20),
                //             ),
                //           ),
                //         ]),
                //       ),
                //     ),
                //     InkWell(
                //       child: Padding(
                //         padding: EdgeInsets.all(10.0),
                //         child: Row(children: [
                //           Icon(
                //             Icons.headphones,
                //             size: 30,
                //             color: Colors.grey,
                //           ),
                //           Container(
                //             margin: EdgeInsets.only(left: 40),
                //             child: Text(
                //               'Contact Us',
                //               style: TextStyle(color: Colors.grey, fontSize: 20),
                //             ),
                //           ),
                //         ]),
                //       ),
                //     ),
                //   ],
                // )),
              ]));
        });
  }
}
