import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CustomerReviewsApi with ChangeNotifier {
  List _customerReviewsData = [];

  List get customerReviewsData {
    getcustomerReviews();
    return [..._customerReviewsData];
  }

  Future getcustomerReviews() async {
    http.Response response;
    response = await http
        .get(Uri.parse('https://vinit-api-data.herokuapp.com/customerReviews'));
    if (response.statusCode == 200) {
      _customerReviewsData = json.decode(response.body);
    }
  }
}
