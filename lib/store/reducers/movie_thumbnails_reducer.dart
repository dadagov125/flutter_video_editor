
import 'package:redux/redux.dart';
import 'package:video_editot/store/actions/actions.dart';
import 'package:video_editot/store/states/movie_thumbnails_state.dart';

MovieThumbnailsState _loadMovieThumbnails(MovieThumbnailsState state, LoadMovieThumbnailsAction action) {
  return MovieThumbnailsState(thumbnails: action.thumbnails);
}

final movieThumbnailsReducer = combineReducers<MovieThumbnailsState>(
    [TypedReducer<MovieThumbnailsState, LoadMovieThumbnailsAction>(_loadMovieThumbnails)]);
