import 'package:flutter/material.dart';
import 'package:food_blaze/pages/details_page.dart';

import '../data/featured_food_data.dart';
import 'custom_text.dart';
import 'favourite_button.dart';

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
            child: GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return DetailsPage(
                    featuredFoodModel: featuredFoodList[index],
                  );
                }));
              },
              child: Container(
                width: 200,
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
                                  text: featuredFoodList[index]
                                      .rating
                                      .toString()),
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
            ),
          );
        },
      ),
    );
  }
}
