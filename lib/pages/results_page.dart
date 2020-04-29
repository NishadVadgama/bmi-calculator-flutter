import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/widgets/bottom_button.dart';
import 'package:bmi_calculator/widgets/reusable_card.dart';
import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Text(
              'Your results',
              style: TextStyle(
                fontSize: 40.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              color: kActiveCardBackgroundColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    'Normal',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '18.0',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 60.0),
                  ),
                  Text(
                    'Your BMI score is really low!',
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  )
                ],
              ),
            ),
          ),
          BottomButton(
            onTap: () {
              //              Navigator.pushNamed(context, '/results');
              Navigator.pop(context);
            },
            title: 'RE-CALCULATE',
          )
        ],
      ),
    );
  }
}
