import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  static const ID = "id";
  static const NAME = "name";
  static const PRICE = "price";
  static const IMAGE = "image";
  static const PRODUCT_ID = "productId";
  static const QUANTITY = "quantity";

  String _id;
  String _name;
  double _price;
  String _image;
  String _productId;
  String _quantity;

  String get id => _id;
  String get name => _name;
  double get price => _price;
  String get image => _image;
  String get quantity => _quantity;
  String get productId => _productId;

  ProductModel.fromSnapshot(DocumentSnapshot snapshot) {
    _id = snapshot.get(ID);
    _name = snapshot.get(NAME);
    _price = snapshot.get(PRICE);
    _quantity = snapshot.get(QUANTITY);
    _image = snapshot.get(IMAGE);
    _productId = snapshot.get(PRODUCT_ID);
  }
}
