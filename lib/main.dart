import 'dart:io';

import 'package:video_editot/store/actions/actions.dart';
import 'package:video_editot/store/middleware/test_middleware.dart';
import 'package:video_editot/store/reducers/app_reducer.dart';
import 'package:video_editot/store/states/app_state.dart';
import 'package:video_editot/ui/screens/home_screen.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';
import 'dart:core';
import 'package:path_provider/path_provider.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  final store = Store<AppState>(appReducer,
      initialState: AppState.initialState(),
      middleware: createStoreMiddlewares());

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp(
        title: 'Test App',
        routes: {
          "home":(context)=>HomeScreen()


        },
        initialRoute: "home",

//        home: Scaffold(
//          body: StoreConnector<AppState, String>(
//            converter: (store)=>store.state.test.text,
//
//            builder: (context, vm)=>Text(vm),
//          ),
//
//          floatingActionButton: StoreConnector<AppState, VoidCallback >(
//            converter: (store)=>()=> store.dispatch(WriteTestAction("New Text")),
//
//            builder: (context, callback)=>FloatingActionButton(
//              onPressed: callback,
//                tooltip: 'Increment',
//                child: new Icon(Icons.add)
//            ),
//
//          )
//
//
//
//        )
      ),
    );
  }
}