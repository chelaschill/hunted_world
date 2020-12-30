import 'dart:math';
import 'package:flutter/material.dart';

class Wizard extends StatelessWidget {
  final direction;

  Wizard({this.direction});

  @override
  Widget build(BuildContext context) {
    if (direction == "right") {
      return Container(
        height: 160,
        width: 160,
        child: Image.asset("images/wizard.png"),
      );
    } else {
      return Transform(
        alignment: Alignment.center,
        transform: Matrix4.rotationY(pi),
        child: Container(
          height: 160,
          width: 160,
          child: Image.asset("images/wizard.png"),
        ),
      );
    }
  }
}
