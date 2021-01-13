import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_blaze/models/user_model.dart';
import 'package:food_blaze/utilities/user_services.dart';

enum Status {
  Uninitialized,
  Unauthenticated,
  Authenticating,
  Authenticated,
}

class AuthProvider with ChangeNotifier {
  FirebaseAuth _auth;
  User _user;
  Status _status = Status.Uninitialized;
  UserServices _userServices = UserServices();
  UserModel _userModel;

  // getters: can sccess the values of the variables but cant modify it

  Status get status => _status;
  User get user => _user;
  UserModel get userModel => _userModel;

  final formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  AuthProvider.initialize() : _auth = FirebaseAuth.instance {
    // when user changes from unauthenticated to authenticated, we want to be listen and then do something to reflect that change in firebase
    _auth.userChanges().listen(_onStateChanged);
  }

  Future<bool> signIn() async {
    try {
      _status = Status.Authenticating;
      notifyListeners();
      await _auth.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      return true;
    } catch (e) {
      return _onError(e.toString());
    }
  }

  Future<void> signOut() {
    _auth.signOut();
    _status = Status.Unauthenticated;
    notifyListeners();
    return Future.delayed(Duration.zero);
  }

  Future<bool> signUp() async {
    try {
      _status = Status.Authenticating;
      notifyListeners();
      await _auth
          .createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      )
          .then(
        (user) {
          Map<String, dynamic> values = {
            "name": usernameController.text,
            "email": emailController.text,
            "id": user.user.uid,
          };
          _userServices.createUser(values);
          return true;
        },
      );

      return true;
    } catch (e) {
      return _onError(e.toString());
    }
  }

  Future<void> _onStateChanged(User firebaseUser) async {
    if (firebaseUser == null) {
      _status = Status.Uninitialized;
    } else {
      _user = firebaseUser;
      _status = Status.Authenticated;
      _userModel = await _userServices.getUserById(firebaseUser.uid);
    }
    notifyListeners();
  }

//

  bool _onError(String error) {
    _status = Status.Unauthenticated;
    notifyListeners();
    print(error.toString());
    return false;
  }

  void cleanCOntrollers() {
    emailController.text = '';
    passwordController.text = '';
    usernameController.text = '';
  }
}
