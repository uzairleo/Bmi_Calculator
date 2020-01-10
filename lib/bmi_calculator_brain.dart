import 'package:flutter/material.dart';
import 'dart:math';

class BmiCalculator{
  final int weight;
  final int height;
  double _bmi;
  String _status;
  String _message;

  BmiCalculator({@required this.weight, @required this.height}) {
    this._bmi = (weight / (pow(height/100, 2)));
    if (this._bmi <= 16) {
      _status = 'Underweight';
      _message = 'Alaka mre, Der khwarak kawa che lag sorba she!';
    }
    else if (this._bmi <= 25) {
      _status = 'Normal';
      _message = 'Bss kha teek rawan e da trorai zweya, lagya osa';
    }
    else if (this._bmi >= 30) {
      _status = 'Overweight';
      _message =
      'Zalim bachiya ka kor prade de nor kheta kho de khpala da kana guzara kawa';
    }
  }

  double getBmi(){
    return _bmi;
  }

  String getStatus(){
    return _status;
  }

  String getMessage(){
    return _message;
  }

}