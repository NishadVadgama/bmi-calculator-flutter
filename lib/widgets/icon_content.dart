import 'package:flutter/material.dart';

import '../constants.dart';

class IconContent extends StatelessWidget {
  IconContent({this.iconData, this.title});

  final IconData iconData;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          iconData,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          title,
          style: kTitleStyle,
        )
      ],
    );
  }
}
