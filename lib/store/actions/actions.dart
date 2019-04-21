import 'dart:io';

class WriteTestAction {
  String text;

  WriteTestAction(this.text);
}

class Pre_LoadMoviesAction {}

class LoadMoviesAction {
  List<FileSystemEntity> movies;

  LoadMoviesAction(this.movies);
}
