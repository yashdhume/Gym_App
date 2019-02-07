import 'package:gym_app/domain/app_state.dart';
import 'package:gym_app/domain/actions.dart';
import 'package:gym_app/data/theme.dart';
import 'package:gym_app/data/exercise.dart';

AppState appstateReducer(AppState state, action) {
  return AppState(
    platesReducer(state.plates, action),
    barWeightReducer(state.barWeight, action),
    themeReducer(state.theme, action),
    exercisesReducer(state.exercises, action),
  );
}

List<Exercise> exercisesReducer(List<Exercise> state, action) {
  if (action is LoadedExercises) {
    return action.exercises;
  }
}

List<double> platesReducer(List<double> state, action) {
  if (action is SetPlates) {
    List a = action.plates;
    a.sort();
    a = a.reversed.toList();
    return a;
  }
  return state;
}

double barWeightReducer(double state, action) {
  if (action is SetBarWeight) {
    if (action.weight >= 0) return action.weight;
    return state;
  }
  return state;
}

AppTheme themeReducer(AppTheme state, action) {
  return state;
}
