import 'package:math_expressions/math_expressions.dart';

import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:simple_cal/Button.dart';

void main() {
  runApp(CalApp());
}

class CalApp extends StatefulWidget {
  @override
  CalAppState createState() => CalAppState();
}

class CalAppState extends State<CalApp> {
  String _history = '';

  String _expression = '';

  void Click(String text) {
    setState(() => _expression += text);
  }

  void allClear(String text) {
    setState(() {
      _history = '';

      _expression = '';
    });
  }

  void clear(String text) {
    setState(() {
      _expression = '';
    });
  }

  void evaluate(String text) {
    Parser p = Parser();

    Expression exp = p.parse(_expression);

    ContextModel cm = ContextModel();

    setState(() {
      _history = _expression;

      _expression = exp.evaluate(EvaluationType.REAL, cm).toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CALCULATOR',
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 6, 83, 102),
        body: Container(
          padding: EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: Text(
                    _history,
                    style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                        fontSize: 24,
                        color: Color.fromARGB(255, 249, 241, 241),
                      ),
                    ),
                  ),
                ),
                alignment: Alignment(1.0, 1.0),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text(
                    _expression,
                    style: GoogleFonts.rubik(
                      textStyle: TextStyle(
                        fontSize: 48,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                alignment: Alignment(1.0, 1.0),
              ),
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Button(
                    text: 'AC',
                    fillColor: 0xFF6C807F,
                    textSize: 20,
                    callback: allClear,
                  ),
                  Button(
                    text: 'C',
                    fillColor: 0xFF6C807F,
                    callback: clear,
                  ),
                  Button(
                    text: '%',
                    fillColor: 0xFFFFFFFF,
                    textColor: 0xFF65BDAC,
                    callback: Click,
                  ),
                  Button(
                    text: '/',
                    fillColor: 0xFFFFFFFF,
                    textColor: 0xFF65BDAC,
                    callback: Click,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Button(
                    text: '7',
                    callback: Click,
                  ),
                  Button(
                    text: '8',
                    callback: Click,
                  ),
                  Button(
                    text: '9',
                    callback: Click,
                  ),
                  Button(
                    text: '*',
                    fillColor: 0xFFFFFFFF,
                    textColor: 0xFF65BDAC,
                    textSize: 24,
                    callback: Click,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Button(
                    text: '4',
                    callback: Click,
                  ),
                  Button(
                    text: '5',
                    callback: Click,
                  ),
                  Button(
                    text: '6',
                    callback: Click,
                  ),
                  Button(
                    text: '-',
                    fillColor: 0xFFFFFFFF,
                    textColor: 0xFF65BDAC,
                    textSize: 38,
                    callback: Click,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Button(
                    text: '1',
                    callback: Click,
                  ),
                  Button(
                    text: '2',
                    callback: Click,
                  ),
                  Button(
                    text: '3',
                    callback: Click,
                  ),
                  Button(
                    text: '+',
                    fillColor: 0xFFFFFFFF,
                    textColor: 0xFF65BDAC,
                    textSize: 30,
                    callback: Click,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Button(
                    text: '.',
                    callback: Click,
                  ),
                  Button(
                    text: '0',
                    callback: Click,
                  ),
                  Button(
                    text: '()',
                    callback: Click,
                    textSize: 26,
                  ),
                  Button(
                    text: '=',
                    fillColor: 0xFFFFFFFF,
                    textColor: 0xFF65BDAC,
                    callback: evaluate,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
