import 'package:flutter/material.dart';

class Ghoul extends StatefulWidget {
  @override
  _GhoulState createState() => _GhoulState();
}

class _GhoulState extends State<Ghoul> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 70,
      child: Image.asset("images/ghoul1.png"),
    );
  }
}
