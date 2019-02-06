import 'package:redux/redux.dart';
import 'package:gym_app/domain/actions.dart';
import 'package:gym_app/domain/app_state.dart';
import 'package:gym_app/data/database.dart';

void appStateMiddleware(Store<AppState> store, action, NextDispatcher next) async{
  next(action);
  if (action is GetExerciseList){
    getExercises().then((value){
      store.dispatch(LoadedExercises(value));
    });
  }
}