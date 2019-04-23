import 'package:redux/redux.dart';
import 'package:video_editot/repositories/file_repository.dart';
import 'package:video_editot/store/actions/actions.dart';
import 'package:video_editot/store/states/app_state.dart';


List<Middleware<AppState>> createStoreMiddlewares() {
  return [
    //TypedMiddleware<AppState, WriteTestAction>(_writeTestMiddleware),
    TypedMiddleware<AppState, Pre_LoadMoviesAction>(_loadMovies),
    TypedMiddleware<AppState, Pre_LoadMovieThumbnailsAction>(_loadMovieThumbnails),
  ];
}

void _writeTestMiddleware(Store<AppState> store, WriteTestAction action, NextDispatcher next) {
  next(action);
}

void _loadMovies(Store<AppState> store, Pre_LoadMoviesAction action, NextDispatcher next){

  var fs=FileService();

//  fs.getMovies().then((movies){
//    next(LoadMoviesAction(movies));
//  });

}


void _loadMovieThumbnails(Store<AppState> store, Pre_LoadMovieThumbnailsAction action, NextDispatcher next){
  var fs=FileService();

  fs.getMovieThumbnails().then((thumbnails){
    next(LoadMovieThumbnailsAction(thumbnails));
  });


}