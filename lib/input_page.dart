import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'resuable_card.dart';
import 'gender_card_data.dart';
import 'constants.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = kInactiveCardColor;
  Color femaleCardColor = kInactiveCardColor;

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
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: GenderCardData(
                      genderIcon: FontAwesomeIcons.mars,
                      gender: 'MALE',
                      genderIconColor: selectedGender == Gender.male
                          ? kActiveGenderDataColor
                          : kInactiveGenderDataColor,
                      genderTextColor: selectedGender == Gender.male
                          ? kActiveGenderDataColor
                          : kInactiveGenderDataColor,
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
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: GenderCardData(
                      genderIcon: FontAwesomeIcons.venus,
                      genderIconColor: selectedGender == Gender.female
                          ? kActiveGenderDataColor
                          : kInactiveGenderDataColor,
                      gender: 'FEMALE',
                      genderTextColor: selectedGender == Gender.female
                          ? kActiveGenderDataColor
                          : kInactiveGenderDataColor,
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
              colour: kActiveCardColor,
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
                    activeColor: kButtonColor,
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
                  colour: kActiveCardColor,
                )),
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColor,
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: kButtonColor,
            margin: EdgeInsets.only(top: 10.0),
            width: double.infinity,
            height: kButtonHeight,
          )
        ],
      ),
    );
  }
}
