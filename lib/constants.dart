import 'package:flutter/material.dart';

const double kButtonHeight = 80.0;
const Color kActiveCardColor = Color(0xFF1D1F33);
const Color kInactiveCardColor = Color(0xFF111328);
const Color kButtonColor = Color(0xFFEB1555);
const Color kActiveGenderDataColor = Colors.white;
const Color kInactiveGenderDataColor = Color(0xFF8D8E98);
const Color kSliderOverlayColor = Color(0x1fEB1555);

const TextStyle kButtonTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 22.0,
);

enum Gender { male, female }
enum ButtonType { plus, minus }

const kSeperationHeight = 8.0;
const kIconSize = 60.0;

const kResultPageTextStyle = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
);

const kNormalBmiTextStyle =
    TextStyle(color: Colors.green, fontWeight: FontWeight.bold);

const kAbnormalBmiTextStyle =
    TextStyle(color: Colors.red, fontWeight: FontWeight.bold);
