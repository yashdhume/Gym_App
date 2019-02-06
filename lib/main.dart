import 'package:flutter/material.dart';
import 'package:gym_app/domain/app_state.dart';
import 'package:gym_app/domain/reducers.dart';
import 'package:gym_app/domain/middleware.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:gym_app/ui/root_page.dart';
import 'package:gym_app/data/auth.dart';

void main(){
  final Store<AppState> store = Store<AppState>(
    appstateReducer,
    initialState: AppState.initalState(),
    middleware: [appStateMiddleware]
  );
  runApp(StoreProvider<AppState>(
    store: store,
    child: GymApp()
  ));
}

class GymApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: new ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.dark,
        primaryColor: Colors.red,
        accentColor: Colors.cyan[600],
      ),
      home: new RootPage(auth: Auth(),),
    );
  }
}
