import 'package:cloud_firestore/cloud_firestore.dart';

class RestaurantModel {
  static const ID = "id";
  static const NAME = "name";
  static const AVG_PRICE = "avgPrice";
  static const RATING = "rating";
  static const IMAGE = "image";
  static const POPULAR = "popular";
  static const RATES = "rates";

  int _id;
  String _name;
  int _avgPrice;
  double _rating;
  String _image;
  bool _popular;
  int _rates;

  int get id => _id;
  String get name => _name;
  int get avgPrice => _avgPrice;
  double get rating => _rating;
  String get image => _image;
  bool get popular => _popular;
  int get rates => _rates;

  RestaurantModel.fromSnapshot(DocumentSnapshot snapshot) {
    _id = snapshot.get(ID);
    _name = snapshot.get(NAME);
    _avgPrice = snapshot.get(AVG_PRICE);
    _rating = snapshot.get(RATING);
    _image = snapshot.get(IMAGE);
    _popular = snapshot.get(POPULAR);
    _rates = snapshot.get(RATES);
  }
}
