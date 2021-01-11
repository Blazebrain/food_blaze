import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:food_blaze/widgets/custom_text.dart';
import 'package:food_blaze/widgets/favourite_button.dart';

import '../models/featured_food_model.dart';

class DetailsPage extends StatefulWidget {
  final FeaturedFoodModel featuredFoodModel;
  const DetailsPage({
    Key key,
    this.featuredFoodModel,
  }) : super(key: key);
  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 300,
              child: Stack(
                children: [
                  Carousel(
                    images: [
                      AssetImage('images/${widget.featuredFoodModel.imageUrl}'),
                      AssetImage('images/${widget.featuredFoodModel.imageUrl}'),
                      AssetImage('images/${widget.featuredFoodModel.imageUrl}'),
                    ],
                    dotBgColor: Colors.white,
                    dotColor: Colors.grey,
                    dotIncreasedColor: Colors.red[500],
                    dotIncreaseSize: 1.5,
                    autoplay: false,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BackButton(),
                        Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(
                                'images/shopping-bag.png',
                                width: 35,
                              ),
                            ),
                            Positioned(
                              right: 5,
                              bottom: 2,
                              child: FavouriteButton(
                                blurRadius: 3,
                                color: Colors.white,
                                icon: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 4.0),
                                  child: CustomText(
                                    text: '2',
                                    color: Colors.red,
                                    weight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 55,
                    right: 14,
                    child: FavouriteButton(
                      icon: Icon(
                        Icons.favorite,
                        color: Colors.red,
                      ),
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: '${widget.featuredFoodModel.name}',
                    size: 26,
                    weight: FontWeight.bold,
                  ),
                  CustomText(
                      text: '\$${widget.featuredFoodModel.price}',
                      size: 18,
                      weight: FontWeight.bold,
                      color: Colors.red)
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                      icon: Icon(
                        Icons.remove,
                        size: 28,
                      ),
                      onPressed: () {}),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    color: Colors.red,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(28, 12, 28, 12),
                      child: CustomText(
                        text: 'Add to Cart',
                        color: Colors.white,
                        weight: FontWeight.w600,
                        size: 24,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                      icon: Icon(
                        Icons.add,
                        color: Colors.red,
                        size: 28,
                      ),
                      onPressed: () {}),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
