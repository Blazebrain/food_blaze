import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'data/providers/category_provider.dart';
import 'data/providers/product_provider.dart';
import 'data/providers/restaurant_provider.dart';
import 'data/providers/user_provider.dart';
import 'pages/inbetween.dart';
import 'pages/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: UserProvider.initialize(),
        ),
        ChangeNotifierProvider.value(
          value: CategoryProvider.initialize(),
        ),
        ChangeNotifierProvider.value(
          value: RestaurantsProvider.initialize(),
        ),
        ChangeNotifierProvider.value(
          value: ProductsProvider.initialize(),
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
    final auth = Provider.of<UserProvider>(context);
    switch (auth.status) {
      case Status.Uninitialized:
        return LoginPage();
      case Status.Unauthenticated:
      case Status.Authenticating:
        return LoginPage();
      case Status.Authenticated:
        return InBetween();
      default:
        return LoginPage();
    }
  }
}
