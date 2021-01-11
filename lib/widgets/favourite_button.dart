import 'package:flutter/material.dart';

class FavouriteButton extends StatelessWidget {
  final Widget icon;
  final Color color;
  final double blurRadius;
  const FavouriteButton({
    Key key,
    this.icon,
    this.color,
    this.blurRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: color,
        boxShadow: [
          BoxShadow(
            blurRadius: blurRadius == null ? 4 : blurRadius,
            offset: Offset(2, 1),
            color: Colors.grey[400],
          )
        ],
      ),
      child: icon,
    );
  }
}
