import 'package:flutter/material.dart';
import 'package:gym_app/PlateMath/PlateMain.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:gym_app/ViewModel.dart';
import 'package:gym_app/ExercisesList/ListExercises.dart';
void main() => runApp(GymApp());

class GymApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return new ScopedModel<ViewModel>(
      model: new ViewModel(),
      child: MaterialApp(
        theme: new ThemeData(
          primarySwatch: Colors.blue,
          brightness: Brightness.dark,
          primaryColor: Colors.red,
          accentColor: Colors.cyan[600],
        ),
        home: new ListExercises(),
      ),
    );
  }
}
