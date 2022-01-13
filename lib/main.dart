import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Color(0xFF0A0D22),
        colorScheme: ColorScheme.dark(
          primary: Color(0xFF0A0D22),
        ),
      ),
      home: InputPage(),
    );
  }
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Center(
        child: Text('Body Text'),
      ),
      floatingActionButton: Theme(
        data: ThemeData().copyWith(
            colorScheme: ThemeData().colorScheme.copyWith(
                  secondary: Colors.purple,
                )),
        child: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
