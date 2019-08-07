import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';

class BottomBar extends StatelessWidget {
  final Function onTap;
  final String text;

  BottomBar({@required this.onTap, @required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(
            text,
            style: TextStyle(fontSize: 18.0),
          ),
        ),
        margin: EdgeInsets.only(top: 10.0),
        padding: EdgeInsets.symmetric(vertical: 24.0),
        color: kBottomContainerColor,
        width: double.infinity,
//        height: kBottomContainerHeight,
      ),
    );
  }
}
