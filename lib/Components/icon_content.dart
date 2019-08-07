import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';

class IconContent extends StatelessWidget {
  final String text;
  final IconData icon;

  IconContent({this.text, this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: FittedBox(
              fit: BoxFit.contain,
              child: Icon(icon),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.all(4.0),
          margin: EdgeInsets.symmetric(vertical: 8.0),
          alignment: Alignment.center,
          color: kBottomContainerColor,
          child: Text(
            text,
            style: kLabelTextStyle,
          ),
        ),
      ],
    );
  }
}
