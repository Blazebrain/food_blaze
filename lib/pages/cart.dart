import 'package:flutter/material.dart';
import 'package:food_blaze/models/featured_food_model.dart';

import '../widgets/custom_text.dart';
import '../widgets/favourite_button.dart';

class ShoppingCart extends StatefulWidget {
  @override
  _ShoppingCartState createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  FeaturedFoodModel product = FeaturedFoodModel(
      imageUrl: '1.jpg',
      name: 'Cereals',
      price: '90',
      rating: 3.0,
      vendor: '4.7',
      wish: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        title: CustomText(
          text: 'Shopping Cart',
          color: Colors.black,
          size: 20,
        ),
        actions: [
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 12, 8, 8),
                child: Image.asset(
                  'images/shopping-bag.png',
                  width: 30,
                  height: 30,
                ),
              ),
              Positioned(
                right: 4,
                bottom: 4,
                child: FavouriteButton(
                  blurRadius: 3,
                  color: Colors.white,
                  icon: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
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
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 8),
            child: CustomText(
              text: 'Your Food Cart',
              weight: FontWeight.w500,
              size: 28,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 180,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.red[100],
                    offset: Offset(3, 5),
                    blurRadius: 30,
                  )
                ],
              ),
              child: Row(
                children: [
                  Image.asset(
                    'images/${product.imageUrl}',
                    height: 120,
                    width: 120,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                          text: TextSpan(children: [
                        TextSpan(
                          text: product.name + '\n',
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.black,
                          ),
                        ),
                        TextSpan(
                          text: "\$" + product.price,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        )
                      ])),
                      SizedBox(
                        width: MediaQuery.of(context).size.width - 280,
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.delete,
                          color: Colors.red,
                          size: 30,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
