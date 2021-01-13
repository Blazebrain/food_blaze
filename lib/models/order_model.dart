import 'package:cloud_firestore/cloud_firestore.dart';

class OrderModel {
  static const ID = "id";
  static const PRODUCT_ID = "productId";
  static const USER_ID = "userId";
  static const AMOUNT = "amount";
  static const STATUS = "status";
  static const DESCRIPTION = "description";
  static const CREATED_AT = "createdAt";

  String _id;
  String _productId;
  int _amount;
  String _status;
  String _userId;
  String _description;
  int _createdAt;

  // getters

  String get id => _id;
  String get productId => _productId;
  int get amount => _amount;
  String get status => _status;
  String get userId => _userId;
  String get description => _description;
  int get createdAt => _createdAt;

  OrderModel.fromSnapshot(DocumentSnapshot snapshot) {
    _id = snapshot.get(ID);
    _userId = snapshot.get(USER_ID);
    _description = snapshot.get(DESCRIPTION);
    _productId = snapshot.get(PRODUCT_ID);
    _amount = snapshot.get(AMOUNT);
    _status = snapshot.get(STATUS);
    _createdAt = snapshot.get(CREATED_AT);
  }
}
