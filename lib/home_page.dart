import 'package:flutter/material.dart';

import 'widgets/categories.dart';
import 'widgets/custom_subtitles.dart';
import 'widgets/custom_text.dart';
import 'widgets/featured_food.dart';
import 'widgets/custom_nav_bar.dart';
import 'widgets/popular_food.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomText(
                    text: 'What do you want to eat?',
                    size: 18,
                    weight: FontWeight.bold,
                  ),
                ),
                Stack(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.notifications_none),
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
            SizedBox(
              height: 4,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 4,
                      offset: Offset(1, 1),
                      color: Colors.grey[300],
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
