import 'package:bmi_app/screens/results.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/card_widget.dart';
import '../constants.dart';
import 'package:flutter_icons/flutter_icons.dart';
import '../components/bottom_button.dart';
import '../components/round_icon_button.dart';
import 'package:bmi_app/calculator_brain.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender = Gender.male;
  int height = 180;
  int weight = 85;
  int age = 40;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Body Mass Index Calculator'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 3,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
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
                    color: selectedGender == Gender.male
                        ? Colors.white
                        : kLabelColor,
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
                    color: selectedGender == Gender.female
                        ? Colors.white
                        : kLabelColor,
                  ),
                ),
              ],
            ),
          ),
          MyCard(
            flex: 5,
            tone: kActiveColor,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(MaterialCommunityIcons.human_male_height_variant),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: <Widget>[
                    Text(
                      height.toString(),
                      style: kNumberStyle,
                    ),
                    SizedBox(
                      width: 4.0,
                    ),
                    Text(
                      'cm',
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
                      Icon(MaterialCommunityIcons.weight_kilogram),
                      Text(
                        weight.toString(),
                        style: kNumberStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RoundButtonWidget(
                            icon: FontAwesomeIcons.minus,
                            function: () {
                              setState(() {
                                weight--;
                              });
                            },
                          ),
                          SizedBox(
                            width: 15.0,
                          ),
                          RoundButtonWidget(
                            icon: FontAwesomeIcons.plus,
                            function: () {
                              setState(() {
                                weight++;
                              });
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                MyCard(
                  tone: kActiveColor,
                  flex: 1,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(MaterialCommunityIcons.cake_variant),
                      Text(
                        age.toString(),
                        style: kNumberStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RoundButtonWidget(
                            icon: FontAwesomeIcons.minus,
                            function: () {
                              setState(() {
                                age--;
                              });
                            },
                          ),
                          SizedBox(
                            width: 15.0,
                          ),
                          RoundButtonWidget(
                            icon: FontAwesomeIcons.plus,
                            function: () {
                              setState(() {
                                age++;
                              });
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            buttonTitle: 'CALCULATE',
            onTap: () {
              CalculatorBrain calc =
                  CalculatorBrain(height: height, weight: weight);

              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ResultsPage(
                            bmiResult: calc.calculateBMI(),
                            resultText: calc.getResult(),
                            interpretationText: calc.getInterpretation(),
                          )));
            },
          ),
        ],
      ),
    );
  }
}
