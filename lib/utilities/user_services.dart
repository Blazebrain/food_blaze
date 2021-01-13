import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_blaze/models/user_model.dart';

class UserServices {
  String collectionName = "users";
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void createUser(Map<String, dynamic> values) {
    _firestore.collection(collectionName).doc(values['id']).set(values);
  }

  void updateUserData(Map<String, dynamic> values) {
    _firestore.collection(collectionName).doc(values['id']).update(values);
  }

  Future<UserModel> getUserById(String id) =>
      _firestore.collection(collectionName).doc(id).get().then((doc) {
        return UserModel.fromSnapshot(doc);
      });
}
