import 'package:flutter/material.dart';
import 'dart:async';

import 'package:food_blaze/widgets/loading.dart';

import 'home_page.dart';

class InBetween extends StatefulWidget {
  @override
  _InBetweenState createState() => _InBetweenState();
}

class _InBetweenState extends State<InBetween> {
  startTime() async {
    var duration = new Duration(seconds: 5);
    return new Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => HomePage()));
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Loading();
  }
}
