import 'package:flutter/material.dart';
import 'CategoryDropdown.dart';

class CategoryItems extends StatefulWidget {
  CategoryItems({Key? key}) : super(key: key);

  @override
  State<CategoryItems> createState() => _CategoryItemsState();
}

class _CategoryItemsState extends State<CategoryItems> {
  List categories = [
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
      'categoryName': 'Waffles',
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
      'categoryName': 'Drinks',
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

  String currentCategory = 'Waffles';

  changeCategory(String category) {
    if (currentCategory == category) {
      setState(() {
        currentCategory = '';
      });
    } else {
      setState(() {
        currentCategory = category;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(

      child: Column(
          children: categories.map((e) {
        return Card(
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${e['categoryName']}(${e['categoryItems'].length})',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                IconButton(
                    onPressed: () {
                      changeCategory(e['categoryName']);
                    },
                    icon: Icon(currentCategory == e['categoryName']
                        ? Icons.arrow_drop_up
                        : Icons.arrow_drop_down))
              ],
            ),
            currentCategory == e['categoryName']
                ? CategoryDropdown(e['categoryItems'])
                : SizedBox(
                    height: 0,
                  ),
          ]),
        );
      }).toList()),
    );
  }
}
