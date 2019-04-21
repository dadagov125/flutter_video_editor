import 'package:video_editot/store/reducers/movie_reducer.dart';
import 'package:video_editot/store/reducers/test_reducer.dart';
import 'package:video_editot/store/states/app_state.dart';

AppState appReducer(AppState state, action) {
  return AppState(
      test: testReducer(state.test, action),
      movieState: movieReducer(state.movieState, action));
}
