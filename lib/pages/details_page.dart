import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';

import '../models/product_model.dart';
import '../widgets/custom_text.dart';
import '../widgets/favourite_button.dart';

class DetailsPage extends StatefulWidget {
  final ProductModel featuredFoodModel;
  const DetailsPage({
    Key key,
    this.featuredFoodModel,
  }) : super(key: key);
  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  int quantityOrdered = 0;
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
                      NetworkImage(widget.featuredFoodModel.image),
                      NetworkImage(widget.featuredFoodModel.image),
                      NetworkImage(widget.featuredFoodModel.image)
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
                  ),
                  Positioned(
                      top: 10,
                      left: 10,
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(4),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                                height: 18,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.black.withOpacity(0.2)),
                                child: Icon(
                                  Icons.close,
                                  color: Colors.white,
                                )),
                          ),
                        ),
                      )),
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Expanded(
                  child: CustomText(
                text: widget.featuredFoodModel.description,
                size: 16,
              )),
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
                      onPressed: () {
                        setState(() {
                          quantityOrdered = quantityOrdered - 1;
                        });
                      }),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    color: Colors.red,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(28, 12, 28, 12),
                      child: CustomText(
                        text: 'Add ' + quantityOrdered.toString() + ' to Cart',
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
                      onPressed: () {
                        setState(() {
                          quantityOrdered = quantityOrdered + 1;
                        });
                      }),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
