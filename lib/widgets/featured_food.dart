import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

import '../models/product_model.dart';
import '../pages/details_page.dart';
import 'custom_text.dart';
import 'favourite_button.dart';
import 'loading.dart';

class FeaturedFood extends StatelessWidget {
  final List<ProductModel> featuredFoodsList;
  const FeaturedFood({
    Key key,
    this.featuredFoodsList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 8),
      height: 240,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: featuredFoodsList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(4.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return DetailsPage(
                    featuredFoodModel: featuredFoodsList[index],
                  );
                }));
              },
              child: Container(
                width: 200,
                height: 240,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
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
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(16),
                              topRight: Radius.circular(16)),
                          child: Stack(
                            children: [
                              Positioned.fill(
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Container(
                                    child: Loading(),
                                  ),
                                ),
                              ),
                              FadeInImage.memoryNetwork(
                                placeholder: kTransparentImage,
                                image: featuredFoodsList[index].image,
                                fit: BoxFit.cover,
                                height: 150,
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          top: 5,
                          right: 5,
                          child: FavouriteButton(
                            color: Colors.white,
                            icon: featuredFoodsList[index].featured
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
                            text: featuredFoodsList[index].name,
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
                                  text: featuredFoodsList[index]
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
                            text: '\$' +
                                featuredFoodsList[index].price.toString(),
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
