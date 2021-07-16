import 'package:calculator/screens/calculator_body.dart';
import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffE0E0E0),
        appBar: AppBar(
          backgroundColor: Color(0XFF30B700),
          title: Text(
            'Calculator',
            style: TextStyle(fontSize: 25.0),
          ),
          centerTitle: true,
        ),
        body: CalculatorBody(),
      ),
    );
  }
}
