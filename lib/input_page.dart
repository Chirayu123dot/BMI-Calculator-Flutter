import 'package:flutter/material.dart';

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
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xFF1D1F33),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    margin: EdgeInsets.all(20.0),
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xFF1D1F33),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    margin: EdgeInsets.all(20.0),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xFF1D1F33),
                borderRadius: BorderRadius.circular(10.0),
              ),
              margin: EdgeInsets.all(20.0),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xFF1D1F33),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    margin: EdgeInsets.all(20.0),
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xFF1D1F33),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    margin: EdgeInsets.all(20.0),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
