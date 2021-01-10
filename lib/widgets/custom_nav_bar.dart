import 'package:flutter/material.dart';

import 'custom_text.dart';

class MyNavBar extends StatelessWidget {
  const MyNavBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(showUnselectedLabels: true, items: [
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
