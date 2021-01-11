import 'package:flutter/material.dart';

import '../data/category_data.dart';
import 'custom_text.dart';

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
