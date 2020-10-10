import 'file:///D:/Flutter/bmi_app/lib/widgets/card_child.dart';
import 'package:bmi_app/screens/result.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../widgets/bottom_button.dart';
import '../widgets/cards.dart';
import '../constants.dart';
import 'package:bmi_app/bmi_calculator.dart';

enum Gender { male, female, lgbtq }

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color maleCardColor = kPassiveCardColor;
  Color femaleCardColor = kPassiveCardColor;
  Color transCardColor = kPassiveCardColor;

  Gender selectedGender;
  double height = 150;
  int weight = 50;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// App Bar
      appBar: AppBar(
        title: Text("BMI Calculator"),
      ),

      /// Body
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Cards(
                    color: Gender.male == selectedGender
                        ? kActiveCardColor
                        : kPassiveCardColor,
                    gestureFunction: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    cardChild: CardChild(
                      gender: 'MALE',
                      genderIcon: FontAwesomeIcons.mars,
                    ),
                  ),
                ),
                Expanded(
                  child: Cards(
                    gestureFunction: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    color: Gender.female == selectedGender
                        ? kActiveCardColor
                        : kPassiveCardColor,
                    cardChild: CardChild(
                      genderIcon: FontAwesomeIcons.venus,
                      gender: 'FEMALE',
                    ),
                  ),
                ),
                Expanded(
                  child: Cards(
                    gestureFunction: () {
                      setState(() {
                        selectedGender = Gender.lgbtq;
                      });
                    },
                    color: Gender.lgbtq == selectedGender
                        ? kActiveCardColor
                        : kPassiveCardColor,
                    cardChild: CardChild(
                      genderIcon: FontAwesomeIcons.transgender,
                      gender: 'LGBTQ',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Cards(
              color: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "HEIGHT",
                    style: kLabelTextStyle,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(height.toInt().toString(), style: kNumbersTextStyle),
                      SizedBox(
                        width: 5.0,
                      ),
                      Text(
                        "cm",
                        style: kLabelTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        inactiveTrackColor: kPassiveCardColor,
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30.0),
                        thumbColor: kBottomButtonColor,
                        activeTrackColor: kBottomButtonColor,
                        overlayColor: Color(0x29EB1555)),
                    child: Slider(
                      min: 120,
                      max: 220,
                      value: height,
                      onChanged: (double value) {
                        setState(() {
                          height = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Cards(
                    color: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Weight',
                          style: kLabelTextStyle,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumbersTextStyle,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              iconFunction: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              iconFunction: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Cards(
                    color: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Age',
                          style: kLabelTextStyle,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          age.toString(),
                          style: kNumbersTextStyle,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              iconFunction: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              iconFunction: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            text: "Calculate BMI",
            onTap: () {
              BMICalculator bmiCalculator =
                  BMICalculator(height: height.toInt(), weight: weight);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(
                    bmi: bmiCalculator.calculateBMI(),
                    comment: bmiCalculator.getResult(),
                    advice: bmiCalculator.getInterpretation(),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final Function iconFunction;

  RoundIconButton({this.icon, this.iconFunction});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: iconFunction,
      shape: CircleBorder(),
      fillColor: Color(0xff4C4F5E),
      constraints: BoxConstraints.tightFor(width: 56.0, height: 50.0),
      elevation: 6.0,
      child: Icon(
        icon,
      ),
    );
  }
}
