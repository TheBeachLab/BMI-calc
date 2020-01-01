import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'card_content.dart';
import 'card_widget.dart';

const bottomContainerHeight = 80.0;
const activeColor = Color(0xff1D1F33);
const inactiveColor = Color(0xFF111328);
const bottomColor = Color(0xFFEB1555);

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
                        ? activeColor
                        : inactiveColor,
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
                        ? activeColor
                        : inactiveColor,
                    cardChild: cardContent(
                        cardIcon: FontAwesomeIcons.venus, cardText: 'FEMALE'),
                  ),
                ],
              ),
            ),
            MyCard(tone: activeColor),
            Expanded(
              child: Row(
                children: <Widget>[
                  MyCard(tone: activeColor),
                  MyCard(tone: activeColor),
                ],
              ),
            ),
            Container(
              height: bottomContainerHeight,
              width: double.infinity,
              color: bottomColor,
            )
          ],
        ));
  }
}
