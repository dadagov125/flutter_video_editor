import 'package:video_editot/store/states/movie_state.dart';
import 'package:video_editot/store/states/test_state.dart';

class AppState {
  TestState test;

  MovieState movieState;

  AppState({this.test, this.movieState});

  factory AppState.initialState() => AppState(
      test: TestState.initialState(), movieState: MovieState.initialState());
}
