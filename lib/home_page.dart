import 'package:flutter/material.dart';
import 'package:food_blaze/widgets/categories.dart';
import 'package:food_blaze/widgets/title.dart';

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
                  child: Text('What do you want to eat'),
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
          ],
        ),
      ),
    );
  }
}
