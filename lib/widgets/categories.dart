import 'package:flutter/material.dart';
import 'package:food_blaze/models/category.dart';

import 'custom_text.dart';

List<Category> categoriesList = [
  Category(name: 'Salad', imageUrl: 'salad.png'),
  Category(name: 'Steak', imageUrl: 'steak.png'),
  Category(name: 'Fast food', imageUrl: 'sandwich.png'),
  Category(name: 'Deserts', imageUrl: 'ice-cream.png'),
  Category(name: 'Sea Food', imageUrl: 'fish.png'),
  Category(name: 'Salad', imageUrl: 'salad.png'),
  Category(name: 'Steak', imageUrl: 'steak.png'),
];

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: ListView.builder(
          itemCount: categoriesList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 4,
                          offset: Offset(4, 6),
                          color: Colors.red[50],
                        )
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(4),
                      child: Image.asset(
                        'images/${categoriesList[index].imageUrl}',
                        width: 50,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomText(
                    text: categoriesList[index].name,
                    size: 14,
                    color: Colors.black,
                  ),
                ],
              ),
            );
          }),
    );
  }
}
