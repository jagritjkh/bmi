import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:bmi_calculator/Screens/input_page.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    new Future.delayed(
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => InputPage()),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CircleAvatar(
            radius: 40.0,
            backgroundColor: kBottomContainerColor,
            child: Icon(
              Icons.loyalty,
              color: Colors.white,
              size: 40.0,
            ),
          ),
          ColorizeAnimatedTextKit(
            textAlign: TextAlign.center,
            alignment: Alignment.center,
            text: ['BMI, BMR & Ideal Weight CALCULATOR'],
            colors: [
              Colors.white,
              kBottomContainerColor,
              Colors.white,
            ],
            textStyle: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.w900,
            ),
          ),
        ],
      ),
    );
  }
}
