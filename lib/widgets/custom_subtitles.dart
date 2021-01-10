import 'package:flutter/material.dart';

import 'custom_text.dart';

class CustomSubTitles extends StatelessWidget {
  final String title;
  const CustomSubTitles({
    Key key,
    @required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CustomText(
        text: title,
        size: 20,
        color: Colors.grey,
        weight: FontWeight.bold,
      ),
    );
  }
}
