import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorBody extends StatefulWidget {
  const CalculatorBody({Key? key}) : super(key: key);

  @override
  _CalculatorBodyState createState() => _CalculatorBodyState();
}

TextEditingController textEditingController = TextEditingController();

class _CalculatorBodyState extends State<CalculatorBody> {
  String equation = "0";
  String result = "0";
  String expression = "";
  double equationFontSize = 38.0;
  double resultFontSize = 68.0;

  buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == "C") {
        equation = "0";
        result = "0";
        equationFontSize = 38.0;
        resultFontSize = 48.0;
      } else if (buttonText == "⌫") {
        equationFontSize = 48.0;
        resultFontSize = 38.0;
        equation = equation.substring(0, equation.length - 1);
        if (equation == "") {
          equation = "0";
        }
      } else if (buttonText == "=") {
        equationFontSize = 38.0;
        resultFontSize = 48.0;

        expression = equation;
        expression = expression.replaceAll('×', '*');
        expression = expression.replaceAll('÷', '/');

        try {
          Parser p = Parser();
          Expression exp = p.parse(expression);

          ContextModel cm = ContextModel();
          result = '${exp.evaluate(EvaluationType.REAL, cm)}';
        } catch (e) {
          result = "Error";
        }
      } else {
        equationFontSize = 48.0;
        resultFontSize = 38.0;
        if (equation == "0") {
          equation = buttonText;
        } else {
          equation = equation + buttonText;
        }
      }
    });
  }

  Widget makeButton(String buttonText, double buttonHeight) {
    return Container(
      padding: EdgeInsets.all(10.0),
      height: MediaQuery.of(context).size.height * 0.1 * buttonHeight,
      child: TextButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Color(0XFF30B700)),
            foregroundColor: MaterialStateProperty.all(Colors.white),
          ),
          onPressed: () => buttonPressed(buttonText),
          child: Text(
            buttonText,
            style: TextStyle(
                fontSize: 35.0,
                fontWeight: FontWeight.normal,
                color: Colors.white),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //For Equation
        Container(
          alignment: Alignment.centerRight,
          padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
          child: Text(
            equation,
            style: TextStyle(fontSize: equationFontSize),
          ),
        ),

        //For Result
        Container(
          alignment: Alignment.centerRight,
          padding: EdgeInsets.fromLTRB(10, 30, 10, 0),
          child: Text(
            result,
            style: TextStyle(fontSize: resultFontSize),
          ),
        ),

        //Divider

        Expanded(
          child: Divider(),
        ),

        //Row for buttons

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width * .75,
              child: Table(
                children: [
                  TableRow(children: [
                    makeButton(
                      "C",
                      1,
                    ),
                    makeButton(
                      "⌫",
                      1,
                    ),
                    makeButton(
                      "÷",
                      1,
                    ),
                  ]),
                  TableRow(children: [
                    makeButton(
                      "7",
                      1,
                    ),
                    makeButton(
                      "8",
                      1,
                    ),
                    makeButton(
                      "9",
                      1,
                    ),
                  ]),
                  TableRow(children: [
                    makeButton(
                      "4",
                      1,
                    ),
                    makeButton(
                      "5",
                      1,
                    ),
                    makeButton(
                      "6",
                      1,
                    ),
                  ]),
                  TableRow(children: [
                    makeButton(
                      "1",
                      1,
                    ),
                    makeButton(
                      "2",
                      1,
                    ),
                    makeButton(
                      "3",
                      1,
                    ),
                  ]),
                  TableRow(
                    children: [
                      makeButton(
                        ".",
                        1,
                      ),
                      makeButton(
                        "0",
                        1,
                      ),
                      makeButton(
                        "00",
                        1,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.25,
              child: Table(
                children: [
                  TableRow(children: [
                    makeButton(
                      "×",
                      1,
                    ),
                  ]),
                  TableRow(children: [
                    makeButton(
                      "-",
                      1,
                    ),
                  ]),
                  TableRow(children: [
                    makeButton(
                      "+",
                      1,
                    ),
                  ]),
                  TableRow(children: [
                    makeButton(
                      "=",
                      2,
                    ),
                  ]),
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}
