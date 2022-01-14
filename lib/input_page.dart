import 'package:flutter/material.dart';

const double BUTTON_HEIGHT = 80.0;
const Color DEFAULT_CARD_COLOR = Color(0xFF1D1F33);
const Color BUTTON_COLOR = Color(0xFFEB1555);

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                ReusableCard(colour: DEFAULT_CARD_COLOR),
                ReusableCard(colour: DEFAULT_CARD_COLOR),
              ],
            ),
          ),
          ReusableCard(colour: DEFAULT_CARD_COLOR),
          Expanded(
            child: Row(
              children: [
                ReusableCard(colour: DEFAULT_CARD_COLOR),
                ReusableCard(colour: DEFAULT_CARD_COLOR),
              ],
            ),
          ),
          Container(
            color: BUTTON_COLOR,
            margin: EdgeInsets.only(top: 10.0),
            width: double.infinity,
            height: BUTTON_HEIGHT,
          )
        ],
      ),
    );
  }
}

class ReusableCard extends StatelessWidget {
  final Color colour;

  ReusableCard({required this.colour});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10.0),
        ),
        margin: EdgeInsets.all(20.0),
      ),
    );
  }
}
