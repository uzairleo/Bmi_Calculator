import 'package:flutter/material.dart';

class ReusableCard2 extends StatelessWidget {
  final Color color;
  final Widget childWidget;
  final Function onPressed;
  final int flexProperty;

  ReusableCard2({@required this.color, this.childWidget, this.onPressed, this.flexProperty});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flexProperty,
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          margin: EdgeInsets.all(15.0),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: childWidget,
        ),
      ),
    );
  }
}