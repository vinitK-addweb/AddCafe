import 'package:flutter/material.dart';

class EmptyWishlist extends StatelessWidget {
  const EmptyWishlist({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(
        height: MediaQuery.of(context).size.width * 1.010,
        width: double.infinity,
        child: const Image(
          image: AssetImage('assets/images/wishlist.png'),
          fit: BoxFit.cover,
        ),
      ),
      Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 5),
                child: const Text(
                  'Good food is always cooking !',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 6),
                child: const Text('Go ahead, order some yummy items',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              )
            ],
          ))
    ]);
  }
}
