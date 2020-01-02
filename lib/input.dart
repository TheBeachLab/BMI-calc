import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
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
  Gender selectedGender = Gender.male;
  int height = 180;
  int weight = 85;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Body Mass Index Calculator'),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              flex: 5,
              child: Row(
                children: <Widget>[
                  MyCard(
                    flex: 1,
                    onPress: () {
                      setState(() {
                        print('male tap');
                        selectedGender = Gender.male;
                        height = 180;
                        weight = 85;
                      });
                    },
                    tone: selectedGender == Gender.male
                        ? kActiveColor
                        : kInactiveColor,
                    cardChild: Icon(
                      FontAwesomeIcons.mars,
                      size: 70.0,
                    ),
                  ),
                  MyCard(
                    flex: 1,
                    onPress: () {
                      setState(() {
                        print('female tap');
                        selectedGender = Gender.female;
                        height = 165;
                        weight = 70;
                      });
                    },
                    tone: selectedGender == Gender.female
                        ? kActiveColor
                        : kInactiveColor,
                    cardChild: Icon(
                      FontAwesomeIcons.venus,
                      size: 70.0,
                    ),
                  ),
                ],
              ),
            ),
            MyCard(
              flex: 6,
              tone: kActiveColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: kNumberStyle,
                      ),
                      Text(
                        'CM',
                        style: kLabelTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbColor: kButtonColor,
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: kLabelColor,
                      overlayColor: kButtonShade,
                      thumbShape: RoundSliderThumbShape(
                        enabledThumbRadius: 14.0,
                      ),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 5,
              child: Row(
                children: <Widget>[
                  MyCard(
                    tone: kActiveColor,
                    flex: 1,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'WEIGHT',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumberStyle,
                        ),
                        Row(
                            //
                            )
                      ],
                    ),
                  ),
                  MyCard(
                    tone: kActiveColor,
                    flex: 1,
                  ),
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
