import 'package:flutter/material.dart';

// const GENDER_TEXT_STYLE = TextStyle(
//   fontSize: 18.0,
//   color: Color(0xFF8D8E98),
// );

const SEPARATION_HEIGHT = 8.0;
const ICON_SIZE = 60.0;

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
          size: ICON_SIZE,
          color: genderIconColor,
        ),
        SizedBox(
          height: SEPARATION_HEIGHT,
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
