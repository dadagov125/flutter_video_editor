import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:video_editot/store/actions/actions.dart';
import 'package:video_editot/store/states/app_state.dart';
import 'package:video_editot/ui/containers/movie_list.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    StoreProvider.of<AppState>(context).dispatch(Pre_LoadMovieThumbnailsAction());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MovieList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, "camera");
        },
        child: Icon(Icons.linked_camera),
      ),
    );
  }
}
