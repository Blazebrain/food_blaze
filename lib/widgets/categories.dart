import 'package:flutter/material.dart';

import 'title.dart';

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      child: ListView.builder(
          itemCount: 6,
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
                          color: Colors.red[100],
                        )
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(4),
                      child: Image.asset(
                        'images/salad.png',
                        width: 50,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  CustomText(
                    text: 'Salad',
                    size: 16,
                    color: Colors.black,
                  ),
                ],
              ),
            );
          }),
    );
  }
}
