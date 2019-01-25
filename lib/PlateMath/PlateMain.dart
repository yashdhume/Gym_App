import 'package:flutter/material.dart';
import 'package:gym_app/PlateMath/PlateMath.dart';
import 'package:gym_app/PlateMath/PlateSettings.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:gym_app/ViewModel.dart';

class PlateMain extends StatefulWidget {
  @override
  _PlateMain createState() => new _PlateMain();
}

class _PlateMain extends State<PlateMain> with TickerProviderStateMixin {
  String title;
  final List<MyTabs> _tabs = [
    new MyTabs(title: "Plate Math", color: Colors.red),
    new MyTabs(title: 'Settings', color: Colors.black38)
  ];
  MyTabs _myHandler;

  TabController _controller;

  void initState() {
    super.initState();
    _controller = new TabController(length: _tabs.length, vsync: this);
    _myHandler = _tabs[0];
    _controller.addListener(_handleSelected);
  }

  void _handleSelected() {
    setState(() {
      _myHandler = _tabs[_controller.index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<ViewModel>(
        builder: (context, child, model) => MaterialApp(
              home: DefaultTabController(
                length: 3,
                child: Scaffold(
                  appBar: AppBar(
                    title: new Text(_myHandler.title),
                    backgroundColor: _myHandler.color,
                    bottom: TabBar(
                      // controller: _controller,
                      tabs: [
                        Tab(icon: Icon(Icons.fitness_center)),
                        Tab(icon: Icon(Icons.settings)),
                      ],
                    ),
                  ),
                  body: TabBarView(
                    children: [
                      new PlateMath(),
                      new DisplayPlateButtonss(),
                    ],
                  ),
                ),
              ),
              theme: new ThemeData(
                primarySwatch: Colors.blue,
                brightness: Brightness.dark,
                primaryColor: Colors.red,
                accentColor: Colors.cyan[600],
              ),
            ));
  }
}

class MyTabs {
  final String title;
  final Color color;

  MyTabs({this.title, this.color});
}
