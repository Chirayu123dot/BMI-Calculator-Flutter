import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final Color colour;
  final Widget? cardChild;
  final void Function()? onTapFunction;

  ReusableCard({required this.colour, this.cardChild, this.onTapFunction});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        child: cardChild,
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10.0),
        ),
        margin: EdgeInsets.all(20.0),
      ),
      onTap: onTapFunction,
    );
  }
}
