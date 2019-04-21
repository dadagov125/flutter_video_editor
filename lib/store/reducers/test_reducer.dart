


import 'package:video_editot/store/actions/actions.dart';
import 'package:video_editot/store/states/app_state.dart';


import 'package:redux/redux.dart';

import 'package:video_editot/store/states/test_state.dart';



TestState _writeTest(TestState state, WriteTestAction action) {
  return TestState(action.text);
}


final testReducer = combineReducers<TestState>([
  TypedReducer<TestState, WriteTestAction>(_writeTest)
]);

