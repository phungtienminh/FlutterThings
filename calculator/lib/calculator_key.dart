import 'package:calculator/constant.dart';
import 'package:flutter/material.dart';

class CalculatorKey extends StatelessWidget {
  final String text;
  final Color keyColor, textColor, splashColor;
  final VoidCallback callback;

  CalculatorKey({
    this.text,
    this.keyColor: KEY_COLOR,
    this.textColor: KEY_TEXT_COLOR,
    this.splashColor: KEY_SPLASH_COLOR,
    @required this.callback,
  });
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: KEY_HEIGHT,
      child: RaisedButton(
        color: keyColor,
        splashColor: splashColor,
        elevation: KEY_ELEVATION,
        child: Align(
          alignment: Alignment.center,
          child: Text(
            text,
            style: TextStyle(
              color: textColor,
              fontSize: KEY_TEXT_FONT_SIZE,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        onPressed: callback,
      ),
    );
  }
}