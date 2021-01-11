import 'package:flutter/widgets.dart';

class FeaturedFoodModel {
  final String imageUrl;
  final String name;
  final String price;
  final double rating;
  final String vendor;
  final bool wish;

  FeaturedFoodModel({
    @required this.imageUrl,
    @required this.name,
    @required this.price,
    @required this.rating,
    @required this.vendor,
    this.wish,
  });
}
