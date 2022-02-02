import 'package:bmi_calculator/bottom_button.dart';
import 'package:bmi_calculator/resuable_card.dart';
import 'package:flutter/material.dart';
import 'constants.dart';

class ResultPage extends StatelessWidget {
  ResultPage(
      {required this.bmi,
      required this.result,
      required this.description,
      required this.isBmiNormal});

  final String bmi;
  final String result;
  final String description;
  final bool isBmiNormal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
            child: Text(
              'Your Result',
              style: Theme.of(context).textTheme.bodyText1?.copyWith(
                    fontSize: 40.0,
                  ),
            ),
          ),
          Expanded(
            child: ReusableCard(
              colour: kActiveCardColor,
              cardChild: Column(
                children: [
                  Expanded(
                    child: Center(
                      child: Text(
                        result,
                        style: isBmiNormal
                            ? kNormalBmiTextStyle
                            : kAbnormalBmiTextStyle,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      bmi,
                      style: Theme.of(context).textTheme.bodyText1?.copyWith(
                            fontSize: 90.0,
                          ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Normal BMI Range:'),
                        SizedBox(height: 4.0),
                        Text('18.5 - 24.9', style: kResultPageTextStyle),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32.0),
                      child: Center(
                        child: Text(
                          description,
                          textAlign: TextAlign.center,
                          style: kResultPageTextStyle,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          BottomButton(
            buttonTitle: 'RE-CALCULATE',
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
