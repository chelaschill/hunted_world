import 'package:flutter/material.dart';

class Rayo extends StatelessWidget {
  final direction;

  Rayo({this.direction});

  @override
  Widget build(BuildContext context) {
    if (direction == "right") {
      return Container(
        width: 120,
        child: Container(
          width: 1777,
          child: Image.asset(
            "images/rayo.png",
          ),
        ),
      );
    } else {
      return Container(
        width: 120,
        child: Container(
          width: 1767,
          child: Image.asset(
            "images/rayo.png",
          ),
        ),
      );
    }
  }
}
