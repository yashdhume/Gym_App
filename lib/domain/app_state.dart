import 'package:gym_app/data/theme.dart';
import 'package:gym_app/data/exercise.dart';
class AppState{

  final List<double> plates;
  final double barWeight;
  final AppTheme theme;
  final List<Exercise> exercises;
  AppState(this.plates, this.barWeight, this.theme, this.exercises);

  factory AppState.initalState() => AppState(
    List.unmodifiable([100.0, 55.0, 45.0, 35.0, 25.0, 10.0, 5.0, 2.5]),
    45.0,
    AppTheme.dark(),
    List.unmodifiable([]),
    );
}