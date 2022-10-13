import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// import 'package:flutter_dotenv/flutter_dotenv.dart';
class CustomerReviewsApi with ChangeNotifier {
  List _customerReviewsData = [];

  //getters

  List get customerReviewsData {
    return [..._customerReviewsData];
  }

  //actions

  Future fetchCustomerReviews() async {
    http.Response response;
    response = await http
        .get(Uri.parse('https://vinit-api-data.herokuapp.com/customerReviews'));
    if (response.statusCode == 200) {
      _customerReviewsData = json.decode(response.body);
      print('fetchCUstomerReviews called');
    }
  }
}
