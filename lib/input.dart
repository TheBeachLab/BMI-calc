import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'card_content.dart';
import 'card_widget.dart';
import 'constants.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Body Mass Index Calculator'),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  MyCard(
                    onPress: () {
                      setState(() {
                        print('male tap');
                        selectedGender = Gender.male;
                      });
                    },
                    tone: selectedGender == Gender.male
                        ? kActiveColor
                        : kInactiveColor,
                    cardChild: cardContent(
                      cardIcon: FontAwesomeIcons.mars,
                      cardText: 'MALE',
                    ),
                  ),
                  MyCard(
                    onPress: () {
                      setState(() {
                        print('female tap');
                        selectedGender = Gender.female;
                      });
                    },
                    tone: selectedGender == Gender.female
                        ? kActiveColor
                        : kInactiveColor,
                    cardChild: cardContent(
                        cardIcon: FontAwesomeIcons.venus, cardText: 'FEMALE'),
                  ),
                ],
              ),
            ),
            MyCard(
              tone: kActiveColor,
              cardChild: Column(
                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style: kLabelTextStyle,
                  )
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  MyCard(tone: kActiveColor),
                  MyCard(tone: kActiveColor),
                ],
              ),
            ),
            Container(
              height: kBottomContainerHeight,
              width: double.infinity,
              color: kButtonColor,
            )
          ],
        ));
  }
}
