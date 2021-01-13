import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_blaze/pages/home_page.dart';
import 'package:food_blaze/pages/login_page.dart';
import 'package:food_blaze/providers/auth.dart';

import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: AuthProvider.initialize(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Blaze Meals',
        home: ScreenController(),
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
      ),
    ),
  );
}

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return
//   }
// }

class ScreenController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthProvider>(context);
    switch (auth.status) {
      case Status.Uninitialized:
        return LoginPage();
      case Status.Unauthenticated:
      case Status.Authenticating:
        return LoginPage();
      case Status.Authenticated:
        return HomePage();
      default:
        return LoginPage();
    }
  }
}
