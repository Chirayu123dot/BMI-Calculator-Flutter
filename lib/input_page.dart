import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'resuable_card.dart';
import 'gender_card_data.dart';

const double BUTTON_HEIGHT = 80.0;
const Color ACTIVE_CARD_COLOR = Color(0xFF1D1F33);
const Color INACTIVE_CARD_COLOR = Color(0xFF111328);
const Color BUTTON_COLOR = Color(0xFFEB1555);
const Color ACTIVE_GENDER_DATA_COLOR = Colors.white;
const Color INACTIVE_GENDER_DATA_COLOR = Color(0xFF8D8E98);

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = INACTIVE_CARD_COLOR;
  Color femaleCardColor = INACTIVE_CARD_COLOR;

  Gender? selectedGender;
  int height = 180;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
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
                          ? ACTIVE_GENDER_DATA_COLOR
                          : INACTIVE_GENDER_DATA_COLOR,
                      genderTextColor: selectedGender == Gender.male
                          ? ACTIVE_GENDER_DATA_COLOR
                          : INACTIVE_GENDER_DATA_COLOR,
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
                          ? ACTIVE_GENDER_DATA_COLOR
                          : INACTIVE_GENDER_DATA_COLOR,
                      gender: 'FEMALE',
                      genderTextColor: selectedGender == Gender.female
                          ? ACTIVE_GENDER_DATA_COLOR
                          : INACTIVE_GENDER_DATA_COLOR,
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
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 6.0),
                    child: Text('HEIGHT'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      Text(
                        ' cm',
                      ),
                    ],
                  ),
                  Slider(
                    value: height.toDouble(),
                    onChanged: (double newValue) {
                      setState(() {
                        height = newValue.round();
                      });
                    },
                    max: 220,
                    min: 120,
                    activeColor: BUTTON_COLOR,
                    inactiveColor: Theme.of(context).textTheme.bodyText2?.color,
                  )
                ],
              ),
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
