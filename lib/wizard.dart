import 'dart:math';
import 'package:flutter/material.dart';

class Wizard extends StatelessWidget {
  final direction;

  Wizard({this.direction});

  @override
  Widget build(BuildContext context) {
    if (direction == "right") {
      return Container(
        height: 125,
        width: 125,
        child: Image.asset("images/gatita.png"),
      );
    } else {
      return Transform(
        alignment: Alignment.center,
        transform: Matrix4.rotationY(pi),
        child: Container(
          height: 130,
          width: 130,
          child: Image.asset("images/gatita.png"),
        ),
      );
    }
  }
}
