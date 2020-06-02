import 'package:bmi_calculator/page/result_page.dart';
import 'package:flutter/material.dart';

import 'page/home_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator',
      routes: {
        HomePage.routeName: (context) => HomePage(),
        ResultPage.routeName: (context) => ResultPage(),
      },
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xff090D22),
        scaffoldBackgroundColor: Color(0xff090D22),
      ),
      initialRoute: HomePage.routeName,
    );
  }
}


