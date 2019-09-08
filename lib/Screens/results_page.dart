import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/Components/reusable_card.dart';
import 'package:bmi_calculator/Components/bottom_bar.dart';

class ResultsPage extends StatelessWidget {
  final String finalBmi;
  final String result;
  final String interpretation;
  final String finalBmr;
  final String finalIbw;

  ResultsPage(
      {@required this.finalBmi,
      @required this.result,
      @required this.interpretation,
      @required this.finalBmr,
      @required this.finalIbw});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Result'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
//          Container(
//            padding: EdgeInsets.symmetric(horizontal: 15.0),
//            child: Text(
//              'Your Result',
//              style: kFontTextStyle,
//            ),
//          ),
          Row(
            children: <Widget>[
              Expanded(
                child: ReusableCard(
                  colour: kActiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(6.0),
                        margin: EdgeInsets.symmetric(vertical: 8.0),
                        alignment: Alignment.center,
                        color: kBottomContainerColor,
                        child: Text(
                          "BMR Result",
                          style: kLabelTextStyle,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 8.0),
                        child: Text(
                          finalBmr,
                          style: kFontTextStyle,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ReusableCard(
                  colour: kActiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(6.0),
                        margin: EdgeInsets.symmetric(vertical: 8.0),
                        alignment: Alignment.center,
                        color: kBottomContainerColor,
                        child: Text(
                          "Ideal Body Weight",
                          style: kLabelTextStyle,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 8.0),
                        child: Text(
                          finalIbw,
                          style: kFontTextStyle,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Expanded(
//            flex: 5,
            child: ReusableCard(
              colour: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(6.0),
                    alignment: Alignment.center,
                    color: kBottomContainerColor,
                    child: Text(
                      "BMI Result",
                      style: kLabelTextStyle,
                    ),
                  ),
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
              text: 'RE-CALCULATE'),
        ],
      ),
    );
  }
}
