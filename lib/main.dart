import 'package:flutter/material.dart';
import 'package:gym_app/PlateMath/PlateMath.dart';

void main() => runApp(GymApp());

class GymApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.dark,
        primaryColor: Colors.red,
        accentColor: Colors.cyan[600],
      ),
      home: new PlateMath(),
    );
  }
}