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
  int weight = 60;

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
                            RoundIconButton(ButtonType.minus),
                            SizedBox(width: 8.0),
                            RoundIconButton(ButtonType.plus),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
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

class RoundIconButton extends StatelessWidget {
  RoundIconButton(this.buttonType);

  final ButtonType buttonType;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () {},

      // The elevation of the button
      elevation: 0.0,

      // Size of the button
      constraints: BoxConstraints.tightFor(
        width: 50.0,
        height: 50.0,
      ),

      // Color of the button
      fillColor: Color(0xFF4C4F5E),

      // Shape of the button
      shape: CircleBorder(),

      // The child of the button
      child:
          buttonType == ButtonType.plus ? Icon(Icons.add) : Icon(Icons.remove),

      // The color of the ripple(animation - small circle getting bigger)
      // when the button is pressed
      splashColor: Colors.transparent,

      // The color of the button when pressed
      highlightColor: Colors.transparent,
    );
  }
}
