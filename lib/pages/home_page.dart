import 'package:flutter/material.dart';
import 'package:food_blaze/providers/auth.dart';
import 'package:provider/provider.dart';

import '../widgets/categories.dart';
import '../widgets/custom_subtitles.dart';
import '../widgets/custom_text.dart';
import '../widgets/featured_food.dart';
import '../widgets/custom_nav_bar.dart';
import '../widgets/popular_food.dart';
import 'cart.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0.1,
        title: CustomText(
          text: 'BlazeMeals',
          color: Colors.black,
          size: 22,
          weight: FontWeight.w600,
        ),
        actions: [
          Stack(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ShoppingCart();
                  }));
                },
                icon: Icon(
                  Icons.shopping_cart,
                  color: Colors.black,
                ),
              ),
              Positioned(
                top: 10,
                right: 12,
                child: Container(
                  height: 10,
                  width: 10,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ],
          ),
          Stack(
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.notifications_none,
                  color: Colors.black,
                ),
              ),
              Positioned(
                top: 10,
                right: 12,
                child: Container(
                  height: 10,
                  width: 10,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Colors.orange,
              ),
              accountName: CustomText(
                text: authProvider.userModel.name,
                color: Colors.white,
                weight: FontWeight.bold,
              ),
              accountEmail: CustomText(
                text: authProvider.userModel.email,
                color: Colors.white,
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: CustomText(
                text: 'Home',
              ),
            ),
            ListTile(
              leading: Icon(Icons.fastfood),
              title: CustomText(
                text: 'Food I like',
              ),
            ),
            ListTile(
              leading: Icon(Icons.set_meal),
              title: CustomText(
                text: 'Liked restaurants',
              ),
            ),
            ListTile(
              leading: Icon(Icons.flag),
              title: CustomText(
                text: 'My orders',
              ),
            ),
            ListTile(
              leading: Icon(Icons.shopping_cart),
              title: CustomText(
                text: 'Shopping Cart',
              ),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: CustomText(
                text: 'Settings',
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     Padding(
            //       padding: const EdgeInsets.all(8.0),
            //       child: CustomText(
            //         text: 'What do you want to eat?',
            //         size: 18,
            //         weight: FontWeight.bold,
            //       ),
            //     ),
            //   ],
            // ),
            SizedBox(
              height: 4,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 4,
                      offset: Offset(1, 1),
                      color: Colors.grey[400],
                    )
                  ],
                ),
                child: ListTile(
                  leading: Icon(
                    Icons.search,
                    color: Colors.red,
                  ),
                  trailing: Icon(
                    Icons.filter_list,
                    color: Colors.red,
                  ),
                  title: TextField(
                    decoration: InputDecoration(
                      hintText: 'Find food and restaurants',
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ),
            Categories(),
            CustomSubTitles(title: 'Featured'),
            FeaturedFood(),
            CustomSubTitles(title: 'Popular'),
            PopularFood(),
          ],
        ),
      ),
      bottomNavigationBar: MyNavBar(),
    );
  }
}
