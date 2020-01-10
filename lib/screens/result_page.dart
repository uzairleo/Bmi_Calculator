import 'package:flutter/material.dart';
import 'package:bmi_calculator_flutter/constants.dart';
import 'package:bmi_calculator_flutter/custom_widgets/resusable_card2.dart';
import 'package:bmi_calculator_flutter/custom_widgets/bottom_button.dart';
import 'package:bmi_calculator_flutter/bmi_calculator_brain.dart';

class ResultPage extends StatelessWidget {

  final BmiCalculator bmiCalculator;

  ResultPage({this.bmiCalculator});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: _renderBody(context),
    );
  }

  Widget _renderBody(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Center(
            child: Text(
              'Your Result',
              style: kResultPageHeadStyle,
              textAlign: TextAlign.left,
            ),
          ),
        ),
        ReusableCard2(
          color: kActiveCardColor,
          flexProperty: 5,
          childWidget: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                bmiCalculator.getStatus(),
                style: kResultTextStyle,
              ),
              Text(
                bmiCalculator.getBmi().toStringAsFixed(1),
                style: kBMIValStyle,
              ),
              Text(
                bmiCalculator.getMessage(),
                style: kResultMessageStyle,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        BottomButton(label: 'Re-Calculate BMI',
          onPressed: (){
          Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
