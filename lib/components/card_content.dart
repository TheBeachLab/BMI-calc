import 'package:flutter/material.dart';
import '../constants.dart';

// Reusable card content
class CardContent extends StatelessWidget {
  final String cardText; // text property
  final IconData cardIcon; // icon property
  CardContent(
      {@required this.cardIcon, @required this.cardText}); // constructor

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          cardIcon,
          size: 70.0,
        ),
        SizedBox(height: 10.0),
        Text(
          cardText,
          style: kLabelTextStyle,
        )
      ],
    );
  }
}
