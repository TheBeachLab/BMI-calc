import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import '../constants.dart';
import '../components/card_widget.dart';
import '../components/bottom_button.dart';

final double result = 23.0;

class ResultsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text(
                'Your Results',
                style: kTitleStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: MyCard(
              tone: kActiveColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'NORMAL',
                    style: kResultStyle,
                  ),
                  Text(
                    '18.4',
                    style: kBMIStyle,
                  ),
                  Text(
                    'Your BMI is normal, keep going like this!!',
                    textAlign: TextAlign.center,
                    style: kBodyTextStyle,
                  ),
                  BottomButton(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      buttonTitle: 'RE-CALCULATE'),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
