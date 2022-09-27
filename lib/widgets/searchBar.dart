import 'dart:async';

import 'package:flutter/material.dart';

class Mysearch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(16, 16, 10, 15),
      child: TextField(
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
            iconColor: Colors.white,
            hintStyle: TextStyle(color: Colors.white),
            labelStyle: new TextStyle(color: Colors.white),
            fillColor: Colors.white,
            prefixIcon: const Icon(
              Icons.search,
              color: Colors.white,
            ),
            hintText: 'Dish Name Or Type...',
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.white))),
        onChanged: ((value) => {}),
      ),
    );
  }
}
