import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hunted_world/inicio.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "YCP",
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            color: Colors.blue,
          ),
        ),
        home: Inicio());
  }
}
