import 'dart:io';

import 'package:video_editot/repositories/file_repository.dart';
import 'package:video_editot/store/actions/actions.dart';
import 'package:video_editot/store/middleware/middleware.dart';
import 'package:video_editot/store/reducers/app_reducer.dart';
import 'package:video_editot/store/states/app_state.dart';
import 'package:video_editot/ui/screens/camera_screen.dart';
import 'package:video_editot/ui/screens/home_screen.dart';
import 'package:video_editot/ui/screens/movie_edit_screen.dart';
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
            HomeScreen.routeName: (context) => HomeScreen(),
            CameraScreen.routeName: (context) => CameraScreen(),
            //"movie_edit": (context) => MovieEditScreen()
          },
          initialRoute: HomeScreen.routeName,
          onGenerateRoute: (settings) {
            if (settings.name == MovieEditScreen.routeName) {
              return MaterialPageRoute(
                  builder: (context) =>
                      MovieEditScreen(settings.arguments.toString()));
            }
          }),
    );
  }
}
