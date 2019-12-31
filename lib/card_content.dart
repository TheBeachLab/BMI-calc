import 'package:flutter/material.dart';

// Reusable card content
class cardContent extends StatelessWidget {
  final String cardText; // text property
  final IconData cardIcon; // icon property
  cardContent(
      {@required this.cardIcon, @required this.cardText}); // constructor

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          cardIcon,
          size: 80.0,
        ),
        SizedBox(height: 15.0),
        Text(
          cardText,
          style: TextStyle(
            fontSize: 18.0,
            color: Color(0xFF8D8E98),
          ),
        )
      ],
    );
  }
}
