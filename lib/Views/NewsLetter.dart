import 'package:flutter/material.dart';

class NewsLetter extends StatelessWidget {
  const NewsLetter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Card(
        child: Container(
          padding: EdgeInsets.only(left: 20, right: 20, bottom: 30),
          child: Column(children: [
            Container(
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.only(top: 5),
                child: Text(
                  'Join Our NewsLetter',
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                )),
            TextField(
              decoration: InputDecoration(
                  hintText: 'Email',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)))),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text('Subscribe'),
              style: ElevatedButton.styleFrom(minimumSize: Size.fromHeight(50)),
            )
          ]),
        ),
      ),
    );
  }
}
