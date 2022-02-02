import 'dart:math';

class CalculatorBrain {
  CalculatorBrain({required this.height, required this.weight});

  final int height;
  final int weight;
  late double _bmi;

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  bool isBmiNormal() => _bmi >= 18 && _bmi < 25;

  String getResult() {
    if (_bmi >= 25) {
      return 'OVERWEIGHT';
    } else if (_bmi < 18) {
      return 'UNDERWEIGHT';
    } else {
      return 'NORMAL';
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return 'You have a higher than normal body weight. Try to exercise more.';
    } else if (_bmi < 18) {
      return 'You have a lower than normal body weight. Try to intake more calories.';
    } else {
      return 'You have a normal body weight. Good job!';
    }
  }
}
