import 'package:flutter/material.dart';
import '../constants.dart';

class BottomButton extends StatelessWidget {
  BottomButton({@required this.onTap, @required this.buttonTitle});
  final Function onTap;
  final String buttonTitle;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(
            buttonTitle,
            style: kButtonStyle,
          ),
        ),
        padding: EdgeInsets.only(bottom: 20.0),
        height: kBottomContainerHeight,
        color: kButtonColor,
      ),
    );
  }
}
