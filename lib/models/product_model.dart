import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  static const ID = "id";
  static const NAME = "name";
  static const PRICE = "price";
  static const RATING = "rating";
  static const IMAGE = "image";
  static const FEATURED = "featured";
  static const RESTAURANT_ID = "restaurantId";
  static const RESTAURANT = "restaurant";
  static const CATEGORY = "category";
  static const RATES = "rates";
  static const DESCRIPTION = "description";

  String _id;
  String _name;
  double _price;
  double _rating;
  String _image;
  bool _featured;
  int _restaurantId;
  String _restaurant;
  String _category;
  int _rates;
  String _description;

  String get id => _id;
  String get name => _name;
  double get price => _price;
  double get rating => _rating;
  String get image => _image;
  bool get featured => _featured;
  int get restaurantId => _restaurantId;
  String get restaurant => _restaurant;
  String get category => _category;
  int get rates => _rates;
  String get description => _description;
  ProductModel.fromSnapshot(DocumentSnapshot snapshot) {
    _id = snapshot.get(ID);
    _name = snapshot.get(NAME);
    _price = snapshot.get(PRICE);
    _rating = snapshot.get(RATING);
    _image = snapshot.get(IMAGE);
    _featured = snapshot.get(FEATURED);
    _restaurantId = snapshot.get(RESTAURANT_ID);
    _restaurant = snapshot.get(RESTAURANT);
    _category = snapshot.get(CATEGORY);
    _rates = snapshot.get(RATES);
    _description = snapshot.get(DESCRIPTION);
  }
}
