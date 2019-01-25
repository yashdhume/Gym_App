import 'package:scoped_model/scoped_model.dart';
import 'package:flutter/material.dart';

class ViewModel extends Model {
  List<double> weights = [45, 25, 10, 5, 2.5];
  double barWeight = 45.0;
  final colorDictionary = {
    100.0: Colors.pinkAccent,
    55.0: Colors.orange[600],
    45: Colors.cyan[600],
    35: Colors.yellow[600],
    25: Colors.black,
    10: Colors.green[600],
    5: Colors.red[600],
    2.5: Colors.purple[600]
  };

  void setWeights(List<double> a) {
    weights = a;
    notifyListeners();
  }
  void removeWeight(double value){
    weights.remove(value);
    weights.sort();
    weights =weights.reversed.toList();
    notifyListeners();
  }
  void addWeight(double value){
    weights.add(value);
    weights.sort();
    weights = weights.reversed.toList();
    notifyListeners();
  }
}
