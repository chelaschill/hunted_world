import 'package:flutter/material.dart';


class Fantasmita extends StatefulWidget {
  @override
  _FantasmitaState createState() => _FantasmitaState();
}

class _FantasmitaState extends State<Fantasmita> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      width: 75,
      child: Image.asset("images/fantasmita.png"),
    );
  }
}
