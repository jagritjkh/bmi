import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/Components/reusable_card.dart';
import 'package:bmi_calculator/Components/icon_content.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/Screens/results_page.dart';
import 'package:bmi_calculator/Components/bottom_bar.dart';
import 'package:bmi_calculator/Components/round_icon_button.dart';
import 'package:bmi_calculator/calculator_brain.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

enum Gender {
  maleCard,
  femaleCard,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 180;
  int weight = 60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: ColorizeAnimatedTextKit(
          alignment: Alignment.center,
          text: ['BMI, BMR & Ideal Weight CALCULATOR'],
          colors: [
            Colors.white,
            kBottomContainerColor,
            Colors.white,
          ],
          textStyle: TextStyle(fontSize: 18.0),
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.maleCard;
                      });
                    },
                    colour: selectedGender == Gender.maleCard
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: IconContent(
                      text: 'MALE',
                      icon: FontAwesomeIcons.male,
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(
                        () {
                          selectedGender = Gender.femaleCard;
                        },
                      );
                    },
                    colour: selectedGender == Gender.femaleCard
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: IconContent(
                      text: 'FEMALE',
                      icon: FontAwesomeIcons.female,
                    ),
                  ),
                ),
              ],
            ),
          ),
          ReusableCard(
            colour: kActiveCardColor,
            cardChild: Padding(
              padding: EdgeInsets.all(6.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: kFontTextStyle,
                      ),
                      Text(
                        'cm',
                        style: kLabelTextStyle,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      RoundIconButton(
                        icon: FontAwesomeIcons.minus,
                        onPressed: () {
                          setState(
                            () {
                              (height == 120) ? height = 120 : height--;
                            },
                          );
                        },
                      ),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          activeTrackColor: Colors.white,
                          inactiveTrackColor: Color(0xFF090C22),
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 10.0),
                          thumbColor: kBottomContainerColor,
                          overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 20.0),
                          overlayColor: Colors.blue.withOpacity(0.3),
                        ),
                        child: Slider(
                          value: height.toDouble(),
                          min: 120.0,
                          max: 220.0,
                          onChanged: (double newValue) {
                            setState(
                              () {
                                height = newValue.round();
                              },
                            );
                          },
                        ),
                      ),
                      RoundIconButton(
                        icon: FontAwesomeIcons.plus,
                        onPressed: () {
                          setState(() {
                            (height == 220) ? height = 220 : height++;
                          });
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: ReusableCard(
                  colour: kActiveCardColor,
                  cardChild: Padding(
                    padding: EdgeInsets.all(6.01),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'WEIGHT',
                          style: kLabelTextStyle,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              weight.toString(),
                              style: kFontTextStyle,
                            ),
                            Text(
                              'kg',
                              style: kLabelTextStyle,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  weight == 0 ? weight = 0 : weight--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ReusableCard(
                  colour: kActiveCardColor,
                  cardChild: Padding(
                    padding: EdgeInsets.all(6.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'AGE',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kFontTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  age == 0 ? age = 0 : age--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          BottomBar(
            onTap: () {
              CalculatorBrain calc = CalculatorBrain(
                  gender: selectedGender,
                  height: height,
                  weight: weight,
                  age: age);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return ResultsPage(
                      finalBmi: calc.calculateBmi(),
                      result: calc.getBmiResult(),
                      interpretation: calc.getInterpretation(),
                      finalBmr: selectedGender == Gender.maleCard
                          ? calc.calculateBmrMen()
                          : calc.calculateBmrWomen(),
                      finalIbw: selectedGender == Gender.maleCard
                          ? calc.calculateIbwMen()
                          : calc.calculateIbwWomen(),
                    );
                  },
                ),
              );
            },
            text: 'CALCULATE',
          )
        ],
      ),
    );
  }
}
