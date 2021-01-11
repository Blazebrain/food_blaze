import 'package:flutter/material.dart';
import 'package:food_blaze/pages/cart.dart';
import 'package:food_blaze/pages/home_page.dart';
import 'package:food_blaze/pages/login_page.dart';

import 'custom_text.dart';

class MyNavBar extends StatelessWidget {
  const MyNavBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        onTap: (value) {
          print(value);
          if (value == 0) {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return HomePage();
            }));
          } else if (value == 2) {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return ShoppingCart();
            }));
          } else if (value == 1) {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return LoginPage();
            }));
          }
        },
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              'images/home.png',
              width: 26,
              height: 26,
            ),
            title: CustomText(
              text: 'Home',
              color: Colors.black,
              size: 14,
            ),
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'images/target.png',
              width: 26,
              height: 26,
            ),
            title: CustomText(
              text: 'Near by',
              color: Colors.black,
              size: 14,
            ),
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'images/shopping-bag.png',
              width: 26,
              height: 26,
            ),
            title: CustomText(
              text: 'Cart',
              color: Colors.black,
              size: 14,
            ),
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'images/avatar.png',
              width: 26,
              height: 26,
            ),
            title: CustomText(
              text: 'Account',
              color: Colors.black,
              size: 14,
            ),
          ),
        ]);
  }
}
