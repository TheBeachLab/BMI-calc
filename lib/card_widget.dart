import 'package:flutter/material.dart';

// Reusable card widget
class MyCard extends StatelessWidget {
  final Color tone; // tone property of my card
  final Widget cardChild; // content property of the card
  final Function onPress; // press property of the card

  MyCard(
      {@required this.tone,
      this.cardChild,
      this.onPress}); // constructor with properties

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onPress, // the function will be defined in each object instance
        child: Container(
          child: cardChild,
          margin: EdgeInsets.all(15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: tone,
          ),
        ),
      ),
    );
  }
}
