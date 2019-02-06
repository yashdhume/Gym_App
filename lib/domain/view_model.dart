import 'package:redux/redux.dart';
import 'package:gym_app/domain/app_state.dart';
import 'package:gym_app/domain/actions.dart';
import 'package:gym_app/data/theme.dart';
import 'package:gym_app/data/exercise.dart';
class ViewModel {
  final List<double> plates;
  final double barWeight;
  final AppTheme theme;
  final List<Exercise> exercises;
  final Function(List<double>) onSetPlates;
  final Function(double) onSetBarWeight;

  final Function() onGetExercises;
  ViewModel({
    this.plates,
    this.barWeight,
    this.theme,
    this.exercises,
    this.onSetPlates,
    this.onSetBarWeight,
    this.onGetExercises,
  });

  factory ViewModel.create(Store<AppState> store){
    _onSetPlates(List<double> plates){
      store.dispatch(SetPlates(plates));
    }
    _onSetBarWeight(double weight){
      store.dispatch(SetBarWeight(weight));
    }
    _onGetExercises(){
      store.dispatch(GetExerciseList());
    }
    return ViewModel(
      plates: store.state.plates,
      barWeight: store.state.barWeight,
      theme: store.state.theme,
      exercises: store.state.exercises,
      
      onSetPlates: _onSetPlates,
      onSetBarWeight: _onSetBarWeight,
    );
  }
}