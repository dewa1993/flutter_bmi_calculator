import 'dart:math';

import 'package:flutter/cupertino.dart';

class Calculator {
  final int height;
  final int weight;
  double bmi;

  Calculator({@required this.height, @required this.weight});

  String calculateBMI() {
    bmi = weight / pow(height / 100, 2);
    return bmi.toStringAsFixed(2);
  }

  String getResult() {
    if (bmi >= 25) {
      return 'Overweight';
    } else if (bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Under weight';
    }
  }


  String getInterpretations(){
    if (bmi >= 25) {
      return 'Your BMI is higher than the normal, Try to exercise more.';
    } else if (bmi > 18.5) {
      return 'You have a normal body weight. Good Job.';
    } else {
      return 'You have a lower than normal body weight. You can eat a bit more.';
    }
  }
}
