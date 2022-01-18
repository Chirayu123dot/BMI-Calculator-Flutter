import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'resuable_card.dart';
import 'gender_card_data.dart';

const double BUTTON_HEIGHT = 80.0;
const Color ACTIVE_CARD_COLOR = Color(0xFF1D1F33);
const Color INACTIVE_CARD_COLOR = Color(0xFF111328);
const Color BUTTON_COLOR = Color(0xFFEB1555);
const Color ACTIVE_CARD_GENDER_ICON_COLOR = Colors.white;
const Color INACTIVE_CARD_GENDER_ICON_COLOR = Color(0xFF8D8E98);

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = INACTIVE_CARD_COLOR;
  Color femaleCardColor = INACTIVE_CARD_COLOR;

  Gender? selectedGender;

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
                  child: ReusableCard(
                    colour: selectedGender == Gender.male
                        ? ACTIVE_CARD_COLOR
                        : INACTIVE_CARD_COLOR,
                    cardChild: GenderCardData(
                      genderIcon: FontAwesomeIcons.mars,
                      gender: 'MALE',
                      genderIconColor: selectedGender == Gender.male
                          ? ACTIVE_CARD_GENDER_ICON_COLOR
                          : INACTIVE_CARD_GENDER_ICON_COLOR,
                    ),
                    onTapFunction: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: selectedGender == Gender.female
                        ? ACTIVE_CARD_COLOR
                        : INACTIVE_CARD_COLOR,
                    cardChild: GenderCardData(
                      genderIcon: FontAwesomeIcons.venus,
                      genderIconColor: selectedGender == Gender.female
                          ? ACTIVE_CARD_GENDER_ICON_COLOR
                          : INACTIVE_CARD_GENDER_ICON_COLOR,
                      gender: 'FEMALE',
                    ),
                    onTapFunction: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              colour: ACTIVE_CARD_COLOR,
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                    child: ReusableCard(
                  colour: ACTIVE_CARD_COLOR,
                )),
                Expanded(
                    child: ReusableCard(
                  colour: ACTIVE_CARD_COLOR,
                )),
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
