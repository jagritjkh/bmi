import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/Components/reusable_card.dart';
import 'package:bmi_calculator/Components/bottom_bar.dart';

class ResultsPage extends StatelessWidget {
  final String finalBmi;
  final String result;
  final String interpretation;

  ResultsPage(
      {@required this.finalBmi,
      @required this.result,
      @required this.interpretation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              alignment: Alignment.bottomLeft,
              child: Text(
                'Your Result',
                style: kFontTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    result.toUpperCase(),
                    style: kResultTextStyle,
                  ),
                  Text(
                    finalBmi,
                    style: kFontTextStyle,
                  ),
                  Text(
                    interpretation,
                    textAlign: TextAlign.center,
                    style: kLabelTextStyle,
                  ),
                ],
              ),
            ),
          ),
          BottomBar(
              onTap: () {
                Navigator.pop(context);
              },
              text: 'RE-CALCULATE BMI'),
        ],
      ),
    );
  }
}
