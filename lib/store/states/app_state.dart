import 'package:video_editot/store/states/test_state.dart';

class AppState {
  TestState test;

  AppState({this.test});

  factory AppState.initialState() => AppState(test: TestState.initialState());
}
