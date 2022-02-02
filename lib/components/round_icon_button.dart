import 'package:flutter/material.dart';
import '../constants.dart';

class RoundIconButton extends StatelessWidget {
  RoundIconButton(this.buttonType, this.onPressed);

  final ButtonType buttonType;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,

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
