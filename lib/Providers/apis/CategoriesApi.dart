import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CategoriesApi with ChangeNotifier {
  List _categoriesData = [];
  List _allProducts = [];

  List get allProducts {
    getCategoryProducts('category');
    return _allProducts;
  }

  List get categoriesData {
    getCategories();
    return _categoriesData;
  }

  List getCatProducts(int catId) {
    getCategoryProducts("category");
    return _allProducts.map((item) {
      item.category == catId;
    }).toList();
    // return [];
  }

  Future getCategoryProducts(String category) async {
    http.Response response;
    response = await http.get(Uri.parse(
        'https://cafe.addwebprojects.com/api/v1/catalogue/active-product/?search=Pizza'));
    if (response.statusCode == 200) {
      _allProducts = jsonDecode(response.body) as List;
    }
  }

  Future getCategories() async {
    // http.Response response;
    // response = await http
    //     .get(Uri.parse('https://vinit-api-data.herokuapp.com/customerReviews'));
    // if (response.statusCode == 200) {
    //   print(jsonDecode(response.body));
    // }
    _categoriesData = [
      {
        'categoryName': 'Pizza',
        'categoryItems': [
          {
            'name': 'Chilly',
            'rating': 5,
            'reviewCount': 614,
            'price': 55.00,
            'image':
                'https://images.unsplash.com/photo-1585238342024-78d387f4a707?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=580&q=80'
          },
          {
            'name': 'Potato',
            'rating': 4,
            'reviewCount': 64,
            'price': 45.00,
            'image':
                'https://images.unsplash.com/photo-1585828922344-85c9daa264b0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=640&q=80'
          },
          {
            'name': 'Tomato',
            'rating': 3,
            'reviewCount': 6,
            'price': 35.00,
            'image':
                'https://images.unsplash.com/photo-1632935254449-e777adc9addf?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=580&q=80'
          },
        ],
      },
      {
        'categoryName': 'Burger',
        'categoryItems': [
          {
            'name': 'Chilly',
            'rating': 5,
            'reviewCount': 614,
            'price': 55.00,
            'image':
                'https://images.unsplash.com/photo-1585238342024-78d387f4a707?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=580&q=80'
          },
          {
            'name': 'Potato',
            'rating': 4,
            'reviewCount': 64,
            'price': 45.00,
            'image':
                'https://images.unsplash.com/photo-1585828922344-85c9daa264b0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=640&q=80'
          },
          {
            'name': 'Tomato',
            'rating': 3,
            'reviewCount': 6,
            'price': 35.00,
            'image':
                'https://images.unsplash.com/photo-1632935254449-e777adc9addf?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=580&q=80'
          },
        ],
      },
      {
        'categoryName': 'Cold Beverages',
        'categoryItems': [
          {
            'name': 'Chilly',
            'rating': 5,
            'reviewCount': 614,
            'price': 55.00,
            'image':
                'https://images.unsplash.com/photo-1585238342024-78d387f4a707?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=580&q=80'
          },
          {
            'name': 'Potato',
            'rating': 4,
            'reviewCount': 64,
            'price': 45.00,
            'image':
                'https://images.unsplash.com/photo-1585828922344-85c9daa264b0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=640&q=80'
          },
          {
            'name': 'Tomato',
            'rating': 3,
            'reviewCount': 6,
            'price': 35.00,
            'image':
                'https://images.unsplash.com/photo-1632935254449-e777adc9addf?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=580&q=80'
          },
          {
            'name': 'Potato',
            'rating': 4,
            'reviewCount': 64,
            'price': 45.00,
            'image':
                'https://images.unsplash.com/photo-1585828922344-85c9daa264b0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=640&q=80'
          },
        ],
      },
    ];
  }
}
