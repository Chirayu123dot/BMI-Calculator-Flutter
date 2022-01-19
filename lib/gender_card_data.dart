import 'package:flutter/material.dart';
import 'constants.dart';

class GenderCardData extends StatelessWidget {
  final IconData genderIcon;
  final String gender;
  final Color? genderIconColor;
  final Color? genderTextColor;

  GenderCardData(
      {required this.genderIcon,
      required this.gender,
      this.genderIconColor,
      this.genderTextColor});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          genderIcon,
          size: kIconSize,
          color: genderIconColor,
        ),
        SizedBox(
          height: kSeperationHeight,
        ),
        Text(
          gender,
          style: TextStyle(
            color: genderTextColor,
          ),
          // style: GENDER_TEXT_STYLE,
        ),
      ],
    );
  }
}
