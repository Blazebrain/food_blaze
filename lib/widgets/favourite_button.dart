import 'package:flutter/material.dart';

class FavouriteButton extends StatelessWidget {
  final Icon icon;
  final Color color;
  const FavouriteButton({
    Key key,
    this.icon,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: color,
        boxShadow: [
          BoxShadow(
            blurRadius: 4,
            offset: Offset(2, 1),
            color: Colors.grey[400],
          )
        ],
      ),
      child: icon,
    );
  }
}
