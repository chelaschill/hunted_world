import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hunted_world/fantasmita.dart';
import 'package:hunted_world/rayo.dart';
import 'wizard.dart';
import 'dart:math';

class Inicio extends StatefulWidget {
  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  double wizardX = 0;
  double wizardY = -0.99;
  double rayoX = -10;
  double rayoY = -10;
  String direction = "right";
  bool holding = false;
  double time = 0;
  double height = 0;
  bool crear = false;
  bool lanzando = false;
  Random random = new Random();
  List<AnimatedContainer> fantasmitas = [];

  double generateRandom() {
    return random.nextDouble() * 2 - 1;
  }

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
    if (!lanzando) {
      lanzando = true;
      time = 0;
      rayoX = wizardX * 0.75;
      rayoY = wizardY + 0.37;

      Timer.periodic(Duration(milliseconds: 300), (timer) {
        time += 0.05;
        height = 4.9 * time * time;
        setState(() {
          rayoY = height;
        });
        if (height >= 1) {
          setState(() {
            rayoY = -10;
            lanzando = false;
          });
        }
      });
    }
  }

  List<AnimatedContainer> show() {
    Timer(Duration(seconds: 10), () {
      crear = true;
      if (crear && fantasmitas.length < 10) {
        fantasmitas.add(
          AnimatedContainer(
            duration: Duration(milliseconds: 0),
            alignment: Alignment(generateRandom(), generateRandom()),
            child: Fantasmita(),
          ),
        );
        crear = false;
        print("size: " + fantasmitas.length.toString());
      }
    });
    return fantasmitas;
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
                    AnimatedContainer(
                      duration: Duration(milliseconds: 0),
                      alignment: Alignment(rayoX, rayoY),
                      child: Rayo(),
                    ),
                    Stack(
                      children: show(),
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
