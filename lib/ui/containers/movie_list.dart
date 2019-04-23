




import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:video_editot/store/states/app_state.dart';
import 'package:video_editot/ui/widgets/movie_list_item.widget.dart';

class MovieList extends StatelessWidget{


  @override
  Widget build(BuildContext context) {

    return StoreConnector<AppState, List<FileSystemEntity>>(
      converter: (store)=> store.state.movieThumbnailsState.thumbnails,

      builder: (context, viewModel){

        return ListView(
           children:  viewModel.map((f)=> MovieListItem(movieThumbnail: f)).toList()

        );

      },


    );
  }



}