import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/resuable_card.dart';
import '../components/gender_card_data.dart';
import '../constants.dart';
import '../components/round_icon_button.dart';
import 'result_page.dart';
import '../components/bottom_button.dart';
import '../calculator_brain.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = kInactiveCardColor;
  Color femaleCardColor = kInactiveCardColor;

  Gender? selectedGender;
  int height = 180;
  int weight = 60;
  int age = 20;

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
                  SliderTheme(
                    data: SliderThemeData().copyWith(
                      trackHeight: 1.5,
                      activeTrackColor: kActiveGenderDataColor,
                      inactiveTrackColor: kInactiveGenderDataColor,
                      thumbColor: kButtonColor,
                      overlayColor: kSliderOverlayColor,
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 17.0),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 30.0),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                      max: 220,
                      min: 120,
                    ),
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
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('WEIGHT'),
                        Text(
                          weight.toString(),
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        SizedBox(height: 6.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(ButtonType.minus, () {
                              setState(() {
                                if (weight > 0) weight--;
                              });
                            }),
                            SizedBox(width: 8.0),
                            RoundIconButton(ButtonType.plus, () {
                              setState(() {
                                weight++;
                              });
                            }),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('AGE'),
                        Text(
                          age.toString(),
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        SizedBox(height: 6.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(ButtonType.minus, () {
                              setState(() {
                                if (age > 0) age--;
                              });
                            }),
                            SizedBox(width: 8.0),
                            RoundIconButton(ButtonType.plus, () {
                              setState(() {
                                age++;
                              });
                            }),
                          ],
                        ),
                      ],
                    ),
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

              selectedGender == null
                  ? _showSnackbar(context)
                  : Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ResultPage(
                          bmi: calc.calculateBMI(),
                          result: calc.getResult(),
                          description: calc.getInterpretation(),
                          isBmiNormal: calc.isBmiNormal(),
                        ),
                      ),
                    );
            },
          ),
        ],
      ),
    );
  }

  void _showSnackbar(BuildContext context) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: const Text('Please select a gender'),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
