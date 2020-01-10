import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final Function onPressed;

  RoundIconButton({this.icon, this.onPressed});
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
        fillColor: Color(0xFF4C4F5E),
        shape: CircleBorder(),
        constraints: BoxConstraints.expand(
          width: 50.0,
          height: 50.0,
        ),
        onPressed: onPressed,
        child: Icon(icon,
          color: Colors.white,
        ));
  }
}