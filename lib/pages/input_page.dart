import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widgets/icon_content.dart';
import '../widgets/reusable_card.dart';

enum Gender {
  male,
  female,
}

const bottomContainerHeight = 80.0;
const activeCardBackgroundColor = Color(0xFF1D1E33);
const inactiveCardBackgroundColor = Color(0xFF111328);
const bottomContainerBackgroundColor = Color(0xFFEB1555);

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender = Gender.male;

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
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    child: ReusableCard(
                      color: selectedGender == Gender.male
                          ? activeCardBackgroundColor
                          : inactiveCardBackgroundColor,
                      child: IconContent(
                        iconData: FontAwesomeIcons.mars,
                        title: 'MALE',
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    child: ReusableCard(
                      color: selectedGender == Gender.female
                          ? activeCardBackgroundColor
                          : inactiveCardBackgroundColor,
                      child: IconContent(
                        iconData: FontAwesomeIcons.venus,
                        title: 'FEMALE',
                      ),
                    ),
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
                  child: ReusableCard(color: activeCardBackgroundColor),
                )
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(color: activeCardBackgroundColor),
                ),
                Expanded(
                  child: ReusableCard(color: activeCardBackgroundColor),
                )
              ],
            ),
          ),
          Container(
            height: bottomContainerHeight,
            width: double.infinity,
            color: bottomContainerBackgroundColor,
            margin: EdgeInsets.only(top: 15.0),
          )
        ],
      ),
    );
  }
}
