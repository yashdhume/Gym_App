import 'package:gym_app/data/exercise.dart';

//PLATES ACTIONS
//-----------------------------------------------------
class SetPlates {
  final List<double> plates;

  SetPlates(this.plates);
}
//-----------------------------------------------------

//BAR WEIGHT ACTIONS
//----------------------------------------------------
class SetBarWeight {
  final double weight;

  SetBarWeight(this.weight);
}

//----------------------------------------------------

//DATABASE ACTIONS
//----------------------------------------------------

class GetExerciseList {}

class LoadedExercises {
  List<Exercise> exercises;

  LoadedExercises(this.exercises);
}
