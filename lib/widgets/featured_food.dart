import 'package:flutter/material.dart';
import 'package:food_blaze/models/featured.dart';

import 'custom_text.dart';
import 'favourite_button.dart';

List<Featured> featuredFoodList = [
  Featured(
      imageUrl: '1.jpg',
      name: 'Cereals',
      price: '90',
      rating: 3.0,
      vendor: '4.7',
      wish: true),
  Featured(
      imageUrl: '2.jpg',
      name: 'Grilled Salmon',
      price: '50',
      rating: 3.0,
      vendor: 'Maggi',
      wish: false),
  Featured(
      imageUrl: '3.jpg',
      name: 'Taccos',
      price: '65',
      rating: 4.0,
      vendor: 'Maggi',
      wish: true),
  Featured(
      imageUrl: '4.jpeg',
      name: 'Freshyo',
      price: '30',
      rating: 3.0,
      vendor: 'Maggi',
      wish: false),
  Featured(
      imageUrl: '5.jpg',
      name: 'Cactonus',
      price: '70',
      rating: 3.0,
      vendor: 'Maggi',
      wish: true),
];

class FeaturedFood extends StatelessWidget {
  const FeaturedFood({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 8),
      height: 240,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: featuredFoodList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              width: 180,
              height: 240,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 4,
                    offset: Offset(1, 1),
                    color: Colors.red[100],
                  )
                ],
              ),
              child: Column(
                children: [
                  Stack(
                    children: [
                      Image.asset(
                        'images/${featuredFoodList[index].imageUrl}',
                        height: 140,
                        // width: 140,
                      ),
                      Positioned(
                        top: 5,
                        right: 5,
                        child: FavouriteButton(
                          color: Colors.white,
                          icon: featuredFoodList[index].wish
                              ? Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                  size: 18,
                                )
                              : Icon(
                                  Icons.favorite_border,
                                  color: Colors.red,
                                  size: 18,
                                ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          text: featuredFoodList[index].name,
                          size: 16,
                          weight: FontWeight.w600,
                        ),
                        FavouriteButton(
                          color: Colors.white,
                          icon: Icon(
                            Icons.near_me,
                            size: 16,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CustomText(
                                text:
                                    featuredFoodList[index].rating.toString()),
                            Icon(Icons.star, color: Colors.red, size: 16),
                            Icon(Icons.star, color: Colors.red, size: 16),
                            Icon(Icons.star, color: Colors.red, size: 16),
                            Icon(Icons.star, color: Colors.grey, size: 16),
                            Icon(Icons.star, color: Colors.grey, size: 16),
                          ],
                        ),
                        CustomText(
                          text: featuredFoodList[index].price,
                          weight: FontWeight.bold,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
