import 'package:bmi_calculator/modal/bmi_result.dart';
import 'package:bmi_calculator/modal/constants.dart';
import 'package:bmi_calculator/widget/re_usable_card.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  static const routeName = '/resultPage';

  @override
  Widget build(BuildContext context) {
    final BmiResult args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: <Widget>[
                Text(
                  'Your Result',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: ReusableCard(
                  cardColor: kActiveCardColor,
                  cardChild: Column(
                    children: <Widget>[
                      SizedBox(height: 50,),

                      Text(args.bmiCategory,
                          style: TextStyle(
                              fontSize: 24,
                              color: Colors.greenAccent,
                              fontWeight: FontWeight.bold)),
                      SizedBox(height: 30,),
                      Text(
                        args.bmi,
                        style: TextStyle(fontSize: 80, color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 30,),
                      Text(
                        'Normal BMI Range :',
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                      ),
                      SizedBox(height: 10,),
                      Text(
                        '18.5 - 25 Kg/m2 :',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: 30,),
                      Padding(
                        padding: const EdgeInsets.only(left: 32, right: 32),
                        child: Text(
                          args.bmiDescription,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                      SizedBox(height: 50,),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Container(
            alignment: Alignment.center,
            child: GestureDetector(
              child: Text(
                'RE-CALCULATE YOUR BMI',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            color: kBottomButtonColor,
            height: kButtonHeight,
            width: double.infinity,
          ),
        ],
      ),
    );
  }
}
