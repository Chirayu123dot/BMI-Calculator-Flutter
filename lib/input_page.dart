import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
                ReusableCard(
                  colour: DEFAULT_CARD_COLOR,
                  cardChild: GenderCardData(
                    genderIcon: FontAwesomeIcons.mars,
                    gender: 'MALE',
                  ),
                ),
                ReusableCard(
                  colour: DEFAULT_CARD_COLOR,
                  cardChild: GenderCardData(
                    genderIcon: FontAwesomeIcons.venus,
                    gender: 'FEMALE',
                  ),
                ),
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

class GenderCardData extends StatelessWidget {
  final IconData genderIcon;
  final String gender;

  GenderCardData({required this.genderIcon, required this.gender});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          genderIcon,
          size: 60.0,
          color: Color(0xFF8D8E98),
        ),
        SizedBox(
          height: 8.0,
        ),
        Text(
          gender,
          style: TextStyle(
            fontSize: 18.0,
            color: Color(0xFF8D8E98),
          ),
        ),
      ],
    );
  }
}

class ReusableCard extends StatelessWidget {
  final Color colour;
  final Widget? cardChild;

  ReusableCard({required this.colour, this.cardChild});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: cardChild,
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10.0),
        ),
        margin: EdgeInsets.all(20.0),
      ),
    );
  }
}
