import 'dart:io';

class MovieState {

  List<FileSystemEntity> movies;

  MovieState({this.movies});

  factory MovieState.initialState() => MovieState(movies: List.of([]));
}
