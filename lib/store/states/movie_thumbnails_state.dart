import 'dart:io';

class MovieThumbnailsState {

  List<FileSystemEntity> thumbnails;

  MovieThumbnailsState({this.thumbnails});

  factory MovieThumbnailsState.initialState() => MovieThumbnailsState(thumbnails: List.of([]));
}
