import 'dart:io';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class MovieListItem extends StatelessWidget {
  FileSystemEntity movieThumbnail;

  VideoPlayerController _controller;

  MovieListItem({@required this.movieThumbnail}){
    _controller = VideoPlayerController.file(File(movieThumbnail.path))
      ..initialize();

  }


  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: _controller.value.aspectRatio,
      child: Image(image: FileImage( File(movieThumbnail.path))),
    );
  }
}
