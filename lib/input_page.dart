import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'resuable_card.dart';
import 'gender_card_data.dart';

const double BUTTON_HEIGHT = 80.0;
const Color ACTIVE_CARD_COLOR = Color(0xFF1D1F33);
const Color INACTIVE_CARD_COLOR = Color(0xFF111328);
const Color BUTTON_COLOR = Color(0xFFEB1555);

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = INACTIVE_CARD_COLOR;
  Color femaleCardColor = INACTIVE_CARD_COLOR;

  void updateGenderCard(Gender gender) {
    setState(() {
      if (gender == Gender.male) {
        // male card is selected
        maleCardColor = ACTIVE_CARD_COLOR;
        femaleCardColor = INACTIVE_CARD_COLOR;
      } else {
        // female card is selected
        femaleCardColor = ACTIVE_CARD_COLOR;
        maleCardColor = INACTIVE_CARD_COLOR;
      }
    });
  }

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
                Expanded(
                  child: GestureDetector(
                    child: ReusableCard(
                      colour: maleCardColor,
                      cardChild: GenderCardData(
                        genderIcon: FontAwesomeIcons.mars,
                        gender: 'MALE',
                      ),
                    ),
                    onTap: () {
                      print('Male Card');
                      updateGenderCard(Gender.male);
                    },
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    child: ReusableCard(
                      colour: femaleCardColor,
                      cardChild: GenderCardData(
                        genderIcon: FontAwesomeIcons.venus,
                        gender: 'FEMALE',
                      ),
                    ),
                    onTap: () {
                      print('Female Card');
                      updateGenderCard(Gender.female);
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(child: ReusableCard(colour: ACTIVE_CARD_COLOR)),
          Expanded(
            child: Row(
              children: [
                Expanded(child: ReusableCard(colour: ACTIVE_CARD_COLOR)),
                Expanded(child: ReusableCard(colour: ACTIVE_CARD_COLOR)),
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
