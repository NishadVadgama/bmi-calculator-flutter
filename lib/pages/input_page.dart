import 'package:bmi_calculator/pages/results_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constants.dart';
import '../widgets/bottom_button.dart';
import '../widgets/icon_content.dart';
import '../widgets/reusable_card.dart';
import '../widgets/round_icon_button.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender = Gender.male;
  int height = 180;
  int weight = 50;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    color: selectedGender == Gender.male
                        ? kActiveCardBackgroundColor
                        : kInactiveCardBackgroundColor,
                    child: IconContent(
                      iconData: FontAwesomeIcons.mars,
                      title: 'MALE',
                    ),
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    color: selectedGender == Gender.female
                        ? kActiveCardBackgroundColor
                        : kInactiveCardBackgroundColor,
                    child: IconContent(
                      iconData: FontAwesomeIcons.venus,
                      title: 'FEMALE',
                    ),
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    color: kActiveCardBackgroundColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'HEIGHT',
                          style: kTitleStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: <Widget>[
                            Text(
                              height.toString(),
                              style: kBoldTitle,
                            ),
                            Text(
                              'cm',
                              style: kTitleStyle,
                            )
                          ],
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            inactiveTickMarkColor: kInactiveCardBackgroundColor,
                            activeTrackColor: Colors.white,
                            thumbColor: kSliderThumbColor,
                            overlayColor: kSliderThumbColor,
                            overlayShape:
                                RoundSliderOverlayShape(overlayRadius: 30.0),
                            thumbShape:
                                RoundSliderThumbShape(enabledThumbRadius: 15.0),
                          ),
                          child: Slider(
                            onChanged: (double newValue) {
                              setState(() {
                                height = newValue.round();
                              });
                            },
                            value: height.toDouble(),
                            min: kSliderMinRange,
                            max: kSliderMaxRange,
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    color: kActiveCardBackgroundColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'WEIGHT',
                          style: kTitleStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kBoldTitle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  if (weight > 1) weight--;
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
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    color: kActiveCardBackgroundColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'AGE',
                          style: kTitleStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kBoldTitle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  if (age > 1) age--;
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
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          BottomButton(
            title: 'CALCULATE YOUR BMI',
            onTap: () {
              //              Navigator.pushNamed(context, '/results');
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultsPage(),
                  ));
            },
          )
        ],
      ),
    );
  }
}
