import 'package:bmi_calculator/resuable_card.dart';
import 'package:flutter/material.dart';
import 'constants.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({Key? key}) : super(key: key);

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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              child: Center(
                child: Text('RE-CALCULATE', style: kButtonTextStyle),
              ),
              color: kButtonColor,
              margin: EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: kButtonHeight,
            ),
          )
        ],
      ),
    );
  }
}
