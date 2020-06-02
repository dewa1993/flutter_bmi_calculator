import 'package:bmi_calculator/modal/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CounterWidget extends StatefulWidget {
  final String title;
  final int initCounter;
  final Function resultCallback;

  CounterWidget(
      {@required this.title, @required this.initCounter, this.resultCallback});

  @override
  _CounterWidgetState createState() {
    return _CounterWidgetState(counter: initCounter);
  }
}

class _CounterWidgetState extends State<CounterWidget> {
  int counter;

  _CounterWidgetState({this.counter});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          widget.title,
          style: kActiveLabelStyle,
        ),
        Text(
          counter.toString(),
          style: kNumberTextStyle,
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RawMaterialButton(
              shape: CircleBorder(),
              elevation: 10,
              constraints: BoxConstraints(minWidth: 45, minHeight: 45),
              fillColor: Color(0xFF4C4F5E),
              child: Icon(
                FontAwesomeIcons.plus,
                size: 16,
                color: Colors.white,
              ),
              onPressed: () {
                setState(() {
                  if (counter < 200) {
                    counter++;
                    widget.resultCallback(counter);
                  }
                });
              },
            ),
            SizedBox(
              width: 15,
            ),
            RawMaterialButton(
              shape: CircleBorder(),
              elevation: 10,
              constraints: BoxConstraints(minWidth: 45, minHeight: 45),
              fillColor: Color(0xFF4C4F5E),
              child: Icon(
                FontAwesomeIcons.minus,
                size: 16,
                color: Colors.white,
              ),
              onPressed: () {
                setState(() {
                  if (counter > 0) {
                    counter--;
                    widget.resultCallback(counter);
                  }
                });
              },
            )
          ],
        )
      ],
    );
  }
}
