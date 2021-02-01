import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_blaze/models/restaurant_models.dart';

class RestaurantServices {
  String collectionName = "restaurant";
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<RestaurantModel>> getRestaurant() async {
    return _firestore.collection(collectionName).get().then((restaurants) {
      // document.docs;
      List<RestaurantModel> restaurantsList = [];
      for (DocumentSnapshot restaurant in restaurants.docs) {
        restaurantsList.add(
          RestaurantModel.fromSnapshot(restaurant),
        );
      }

      return restaurantsList;
    });
  }

  Future<RestaurantModel> getRestaurantById(int id) => _firestore
          .collection(collectionName)
          .doc(id.toString())
          .get()
          .then((doc) {
        return RestaurantModel.fromSnapshot(doc);
      });
}
