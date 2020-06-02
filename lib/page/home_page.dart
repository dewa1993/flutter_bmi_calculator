import 'package:bmi_calculator/calculator.dart';
import 'package:bmi_calculator/modal/bmi_result.dart';
import 'package:bmi_calculator/modal/constants.dart';
import 'package:bmi_calculator/modal/enums.dart';
import 'package:bmi_calculator/page/result_page.dart';
import 'package:bmi_calculator/widget/counter_widget.dart';
import 'package:bmi_calculator/widget/gender_widget.dart';
import 'package:bmi_calculator/widget/height_widget.dart';
import 'package:bmi_calculator/widget/re_usable_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Gender selectedGender;
  double selectedHeight = kDefaultHeight;
  int selectedWeight = kDefaultWeight;
  int selectedAge = kDefaultAge;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: ReusableCard(
                    onClick: () => _selectGender(Gender.male),
                    cardColor: selectedGender == Gender.male
                        ? kActiveCardColor
                        : kInActiveCardColor,
                    cardChild: GenderWidget(
                      genderIcon: FontAwesomeIcons.mars,
                      label: 'Male',
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: ReusableCard(
                    onClick: () => _selectGender(Gender.female),
                    cardColor: selectedGender == Gender.female
                        ? kActiveCardColor
                        : kInActiveCardColor,
                    cardChild: GenderWidget(
                      genderIcon: FontAwesomeIcons.venus,
                      label: 'Female',
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: ReusableCard(
              cardColor: kActiveCardColor,
              cardChild: HeightWidget(
                onHeightChanged: (height) {
                  selectedHeight = height;
                },
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: ReusableCard(
                    cardColor: kActiveCardColor,
                    cardChild: CounterWidget(
                      title: 'WEIGHT',
                      initCounter: kDefaultWeight,
                      resultCallback: (weight) {
                        selectedWeight = weight;
                      },
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: ReusableCard(
                    cardColor: kActiveCardColor,
                    cardChild: CounterWidget(
                      title: 'AGE',
                      initCounter: kDefaultAge,
                      resultCallback: (age) {
                        selectedAge = age;
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: GestureDetector(
              child: Text(
                'CALCULATE YOUR BMI',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Calculator result = Calculator(height: selectedHeight.toInt(), weight: selectedWeight);

                Navigator.pushNamed(context, ResultPage.routeName,
                    arguments: BmiResult(
                        bmi: result.calculateBMI(),
                        bmiCategory: result.getResult(),
                        bmiDescription: result.getInterpretations()));
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

  void _selectGender(Gender gender) {
    print('tapped' + gender.toString());
    setState(() {
      selectedGender = gender;
    });
  }
}
