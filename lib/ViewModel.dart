import 'package:scoped_model/scoped_model.dart';
import 'package:flutter/material.dart';
class ViewModel extends Model{
  List<double> weights = [45,35, 25, 10, 5, 2.5];
  double barWeight = 45.0;
  final colorDictionary = {
    50.0: Colors.orange[600],
    45: Colors.cyan[600],
    35: Colors.yellow[600],
    25: Colors.black,
    10: Colors.green[600],
    5 : Colors.red[600],
    2.5: Colors.purple[600]
  };
  void setWeights(List<double> a){
    weights = a;
    notifyListeners();
  }
}