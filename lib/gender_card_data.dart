import 'package:flutter/material.dart';

class GenderCardData extends StatelessWidget {
  final IconData genderIcon;
  final String gender;

  GenderCardData({required this.genderIcon, required this.gender});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          genderIcon,
          size: 60.0,
          color: Color(0xFF8D8E98),
        ),
        SizedBox(
          height: 8.0,
        ),
        Text(
          gender,
          style: TextStyle(
            fontSize: 18.0,
            color: Color(0xFF8D8E98),
          ),
        ),
      ],
    );
  }
}
