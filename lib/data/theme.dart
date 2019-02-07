import 'package:flutter/material.dart';

class AppTheme {
  final colorDictionary;

  AppTheme({this.colorDictionary});

  factory AppTheme.dark() => AppTheme(colorDictionary: {
        100.0: Colors.pinkAccent,
        55.0: Colors.orange[600],
        45: Colors.cyan[600],
        35: Colors.yellow[600],
        25: Colors.black,
        10: Colors.green[600],
        5: Colors.red[600],
        2.5: Colors.purple[600]
      });
}
