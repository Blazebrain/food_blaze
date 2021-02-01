import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_blaze/models/product_model.dart';

class ProductServices {
  String collectionName = "products";
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<ProductModel>> getProducts() async {
    return _firestore.collection(collectionName).get().then((products) {
      // document.docs;
      List<ProductModel> productsList = [];
      for (DocumentSnapshot product in products.docs) {
        productsList.add(
          ProductModel.fromSnapshot(product),
        );
      }

      return productsList;
    });
  }

  Future<List<ProductModel>> getProductsByCategory(String category) async {
    return _firestore
        .collection(collectionName)
        .where(
          "category",
          isEqualTo: category,
        )
        .get()
        .then((products) {
      // document.docs;
      List<ProductModel> productsList = [];
      for (DocumentSnapshot product in products.docs) {
        productsList.add(
          ProductModel.fromSnapshot(product),
        );
      }

      return productsList;
    });
  }

  Future<List<ProductModel>> getProductsByRestaurant(int restaurantId) async {
    return _firestore
        .collection(collectionName)
        .where(
          "restaurantId",
          isEqualTo: restaurantId,
        )
        .get()
        .then((products) {
      // document.docs;
      List<ProductModel> productsList = [];
      for (DocumentSnapshot product in products.docs) {
        productsList.add(
          ProductModel.fromSnapshot(product),
        );
      }

      return productsList;
    });
  }

  Future<List<ProductModel>> searchProducts(productName) {
    _firestore
        .collection(collectionName)
        .orderBy("name")
        .startAt([productName])
        .endAt([productName + '\uf8ff'])
        .get()
        .then((products) {
          List<ProductModel> productsList = [];
          for (DocumentSnapshot product in products.docs) {
            productsList.add(
              ProductModel.fromSnapshot(product),
            );
          }

          return productsList;
        });
  }
}
