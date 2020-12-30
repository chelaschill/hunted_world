import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hunted_world/rayo.dart';
import 'wizard.dart';

class Inicio extends StatefulWidget {
  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  double wizardX = 0;
  double wizardY = -0.99;
  String direction = "right";
  bool holding = false;

  void moveRight() {
    direction = "right";
    Timer.periodic(Duration(milliseconds: 50), (timer) {
      if (holding) {
        if (wizardX <= 1) {
          setState(() {
            wizardX += 0.1;
          });
        }
      } else {
        timer.cancel();
      }
    });
  }

  void moveLeft() {
    direction = "left";
    Timer.periodic(Duration(milliseconds: 50), (timer) {
      if (holding) {
        if (wizardX >= -1) {
          setState(() {
            wizardX -= 0.1;
          });
        }
      } else {
        timer.cancel();
      }
    });
  }

  void shoot() {
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueGrey,
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/fondo.png'),
              fit: BoxFit.fill,
              colorFilter: ColorFilter.mode(
                  Colors.white.withOpacity(0.7), BlendMode.dstATop),
            ),
          ),
          child: Column(
            children: [
              Expanded(
                flex: 10,
                child: Stack(
                  children: [
                    AnimatedContainer(
                      duration: Duration(milliseconds: 0),
                      alignment: Alignment(wizardX, wizardY),
                      child: Wizard(
                        direction: direction,
                      ),
                    ),

                  ],
                ),
              ),
              Container(
                height: 10,
                width: MediaQuery.of(context).size.width,
                color: Colors.black26,
              ),
              Expanded(
                flex: 1,
                child: ListTile(
                  leading: GestureDetector(
                    onTapDown: (details) {
                      holding = true;
                      moveLeft();
                    },
                    onTapUp: (details) {
                      holding = false;
                      setState(() {});
                    },
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                  title: IconButton(
                    icon: Icon(
                      Icons.local_fire_department_sharp,
                      color: Colors.white,
                      size: 30,
                    ),
                    onPressed: () {
                      shoot();
                    },
                  ),
                  trailing: GestureDetector(
                    onTapDown: (details) {
                      holding = true;
                      moveRight();
                    },
                    onTapUp: (details) {
                      holding = false;
                      setState(() {});
                    },
                    child: Icon(
                      Icons.arrow_forward_outlined,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}