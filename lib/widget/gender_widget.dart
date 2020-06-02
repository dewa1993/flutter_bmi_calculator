import 'package:bmi_calculator/modal/constants.dart';
import 'package:flutter/material.dart';



class GenderWidget extends StatelessWidget {
  final IconData genderIcon;
  final String label;


  GenderWidget({this.genderIcon, this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          genderIcon,
          size: kIconSize,
        ),
        SizedBox(
          height: kIconTextSpacing,
        ),
        Text(
          label,
          style: kActiveLabelStyle,
        )
      ],
    );
  }
}
