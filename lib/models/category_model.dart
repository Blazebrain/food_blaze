import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel {
  static const NAME = "name";
  static const ID = "id";
  static const IMAGE = "image";
  String _name;
  String _image;
  int _id;

  int get id => _id;
  String get name => _name;
  String get image => _image;

  CategoryModel.fromSnapshot(DocumentSnapshot snapshot) {
    _id = snapshot.get(ID);
    _name = snapshot.get(NAME);
    _image = snapshot.get(IMAGE);
  }
}
