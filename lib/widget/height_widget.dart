import 'package:bmi_calculator/modal/constants.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class HeightWidget extends StatefulWidget {
  final Function onHeightChanged;

  HeightWidget({@required this.onHeightChanged});

  @override
  _HeightWidgetState createState() => _HeightWidgetState();
}

class _HeightWidgetState extends State<HeightWidget> {

  double selectedHeight = kDefaultHeight;

  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'HEIGHT',
          style: kActiveLabelStyle,
        ),
        Row(
          textBaseline: TextBaseline.alphabetic,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              selectedHeight.round().toString(),
              style: kNumberTextStyle,
            ),
            Text(
              'cm',
              style: kActiveLabelStyle,
            )
          ],
        ),
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            activeTrackColor: Colors.white,
            inactiveTrackColor: Color(0xFF8D8E98),
            thumbColor: kBottomButtonColor,
            overlayColor: Color(0x29EB1555),
            thumbShape: RoundSliderThumbShape(enabledThumbRadius: 16.0),
            overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0)
          ),
          child: Slider(
            value: selectedHeight,
            min: kMinHeight,
            max: kMaxHeight,
            onChanged: (value) {
              setState(() {
                selectedHeight = value;
                widget.onHeightChanged(value);
              });
            },
          ),
        ),
      ],
    );
  }
}
