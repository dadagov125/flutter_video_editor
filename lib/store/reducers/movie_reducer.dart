import 'package:redux/redux.dart';
import 'package:video_editot/store/actions/actions.dart';
import 'package:video_editot/store/states/movie_state.dart';



MovieState _loadMovies(MovieState state, LoadMoviesAction action) {
  return MovieState(movies: action.movies);
}

final movieReducer = combineReducers<MovieState>(
    [TypedReducer<MovieState, LoadMoviesAction>(_loadMovies)]);
