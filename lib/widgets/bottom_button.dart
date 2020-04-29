import 'package:flutter/material.dart';

import '../constants.dart';

class BottomButton extends StatelessWidget {
  BottomButton({this.title, this.onTap});

  final String title;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(
            title,
            style: kLargeButtonTextStyle,
          ),
        ),
        padding: TargetPlatform.iOS == true
            ? EdgeInsets.only(bottom: 20.0)
            : EdgeInsets.only(bottom: 0.0),
        height: kBottomContainerHeight,
        width: double.infinity,
        color: kBottomContainerBackgroundColor,
        margin: EdgeInsets.only(top: 15.0),
      ),
    );
  }
}
