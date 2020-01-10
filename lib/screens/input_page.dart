import 'package:flutter/material.dart';
import 'package:bmi_calculator_flutter/custom_widgets/resuable_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator_flutter/custom_widgets/gender_icon_content.dart';
import 'package:bmi_calculator_flutter/constants.dart';
import 'package:bmi_calculator_flutter/custom_widgets/round_icon_button.dart';
import 'package:bmi_calculator_flutter/screens/result_page.dart';
import 'package:bmi_calculator_flutter/custom_widgets/bottom_button.dart';
import 'package:bmi_calculator_flutter/bmi_calculator_brain.dart';

enum Gender { male, female, none }
Gender selectedGender = Gender.none;
int heightVal = 180;
int weightVal = 30;
int ageVal = 18;

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: _renderBasicSkeleton(),
    );
  }

  Widget _renderBasicSkeleton() {
    return Column(
      children: <Widget>[
        Expanded(
          child: Row(
            children: <Widget>[
              ReusableCard(
                color: (selectedGender == Gender.male)
                    ? kActiveCardColor
                    : kInactiveCardColor,
                childWidget: GenderIconContent(
                  icon: FontAwesomeIcons.mars,
                  title: 'MALE',
                ),
                onPressed: () {
                  setState(() {
                    selectedGender = Gender.male;
                  });
                },
              ),
              ReusableCard(
                color: (selectedGender == Gender.female)
                    ? kActiveCardColor
                    : kInactiveCardColor,
                childWidget: GenderIconContent(
                  icon: FontAwesomeIcons.mars,
                  title: 'FEMALE',
                ),
                onPressed: () {
                  setState(() {
                    selectedGender = Gender.female;
                  });
                },
              ),
            ],
          ),
        ),
        ReusableCard(
          color: kActiveCardColor,
          childWidget: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Height',
                style: kLabelTextStyle,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: <Widget>[
                  Text(
                    heightVal.toString(),
                    style: kNumberTextStyle,
                  ),
                  Text('cm'),
                ],
              ),
              SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                  thumbColor: kBottomSheetColor,
                  overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                  overlayColor: Color(0x29EB1555),
                  activeTrackColor: Colors.white,
                  inactiveTrackColor: kLabelColor,
                ),
                child: Slider(
                  value: heightVal.toDouble(),
                  min: 100.0,
                  max: 220.0,
                  onChanged: (double newVal) {
//                    print(newVal);
                    setState(() {
                      heightVal = newVal.round();
                    });
                  },
                ),
              )
            ],
          ),
        ),
        Expanded(
          child: Row(
            children: <Widget>[
              ReusableCard(
                color: kActiveCardColor,
                childWidget: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Weight',
                      style: kLabelTextStyle,
                    ),
                    Text(
                      weightVal.toString(),
                      style: kNumberTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        RoundIconButton(
                            icon: Icons.add,
                            onPressed: () {
                              setState(() {
                                weightVal++;
                              });
                            }),
                        SizedBox(
                          width: 15.0,
                        ),
                        RoundIconButton(
                          icon: Icons.remove,
                          onPressed: () {
                            setState(() {
                              weightVal--;
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              ReusableCard(
                color: kActiveCardColor,
                childWidget: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Age',
                      style: kLabelTextStyle,
                    ),
                    Text(
                      ageVal.toString(),
                      style: kNumberTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        RoundIconButton(
                            icon: Icons.add,
                            onPressed: () {
                              setState(() {
                                ageVal++;
                              });
                            }),
                        SizedBox(
                          width: 15.0,
                        ),
                        RoundIconButton(
                          icon: Icons.remove,
                          onPressed: () {
                            setState(() {
                              ageVal--;
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        BottomButton(
          label: 'Calculate BMI',
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ResultPage(
                          bmiCalculator: BmiCalculator(
                              height: heightVal, weight: weightVal),
                        )));
          },
        ),
      ],
    );
  }
}
