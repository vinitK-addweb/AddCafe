import 'dart:async';

import 'package:flutter/material.dart';

class Mysearch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(16, 16, 10, 15),
      child: TextField(
        decoration: InputDecoration(
            prefixIcon: const Icon(Icons.search),
            hintText: 'Dish Name Or Type...',
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.blue))),
        onChanged: ((value) => {}),
      ),
    );
  }
}
