import 'package:redux/redux.dart';
import 'package:video_editot/store/actions/actions.dart';
import 'package:video_editot/store/states/app_state.dart';


List<Middleware<AppState>> createStoreMiddlewares() {
  return [
    TypedMiddleware<AppState, WriteTestAction>(_writeTestMiddleware),
  ];
}

void _writeTestMiddleware(Store<AppState> store, action, NextDispatcher next) {

  next(action);
}
