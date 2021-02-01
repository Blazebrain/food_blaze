import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_blaze/models/category_model.dart';

List<CategoryModel> categoriesList = [
  // CategoryModel(name: 'Salad', imageUrl: 'salad.png'),
  // CategoryModel(name: 'Steak', imageUrl: 'steak.png'),
  // CategoryModel(name: 'Fast food', imageUrl: 'sandwich.png'),
  // CategoryModel(name: 'Deserts', imageUrl: 'ice-cream.png'),
  // CategoryModel(name: 'Sea Food', imageUrl: 'fish.png'),
  // CategoryModel(name: 'Salad', imageUrl: 'salad.png'),
  // CategoryModel(name: 'Steak', imageUrl: 'steak.png'),
];

class CategoryServices {
  String collectionName = "categories";
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<CategoryModel>> getCategories() async {
    return _firestore.collection(collectionName).get().then((categories) {
      // document.docs;
      List<CategoryModel> categoriesList = [];
      for (DocumentSnapshot category in categories.docs) {
        categoriesList.add(
          CategoryModel.fromSnapshot(category),
        );
      }

      return categoriesList;
    });
  }
}
