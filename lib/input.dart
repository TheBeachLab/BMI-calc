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
  void changeCardColor(Gender selectedGender) {
    if (selectedGender == Gender.male) {
      if (maleCardColor == inactiveColor) {
        maleCardColor = activeColor;
        femaleCardColor = inactiveColor;
      } else {
        maleCardColor = activeColor;
      }
      ;
    }
    if (selectedGender == Gender.female) {
      if (femaleCardColor == inactiveColor) {
        maleCardColor = inactiveColor;
        femaleCardColor = activeColor;
      } else {
        femaleCardColor = activeColor;
      }
    }
  }

  Color maleCardColor = inactiveColor;
  Color femaleCardColor = inactiveColor;

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
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        print('Male pressed');
                        setState(() {
                          changeCardColor(Gender.male);
                        });
                      },
                      child: MyCard(
                        tone: maleCardColor,
                        cardChild: cardContent(
                          cardIcon: FontAwesomeIcons.mars,
                          cardText: 'MALE',
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        print('Female pressed');
                        setState(() {
                          changeCardColor(Gender.female);
                        });
                      },
                      child: MyCard(
                        tone: femaleCardColor,
                        cardChild: cardContent(
                            cardIcon: FontAwesomeIcons.venus,
                            cardText: 'FEMALE'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(child: MyCard(tone: activeColor)),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(child: MyCard(tone: activeColor)),
                  Expanded(child: MyCard(tone: activeColor)),
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
