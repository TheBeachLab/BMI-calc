import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
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
                  MyCard(tone: Color(0xff1D1F33)),
                  MyCard(tone: Color(0xff1D1F33)),
                ],
              ),
            ),
            MyCard(tone: Color(0xff1D1F33)),
            Expanded(
              child: Row(
                children: <Widget>[
                  MyCard(tone: Color(0xff1D1F33)),
                  MyCard(tone: Color(0xff1D1F33)),
                ],
              ),
            ),
          ],
        ));
  }
}

class MyCard extends StatelessWidget {
  final Color tone; // property of my card
  MyCard({@required this.tone}); // constructor with required property

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: tone,
        ),
      ),
    );
  }
}
