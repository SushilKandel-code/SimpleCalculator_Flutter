import 'package:calculator/screens/calculator_main.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Calculator App',
        theme: ThemeData(
          primarySwatch: Colors.lightBlue,
        ),
        home: Calculator());
  }
}
