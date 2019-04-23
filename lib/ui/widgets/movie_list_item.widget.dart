
import 'dart:io';

import 'package:flutter/material.dart';

class MovieListItem extends StatelessWidget  {

  FileSystemEntity movie;

  MovieListItem({@required this.movie});

  @override
  Widget build(BuildContext context) {

    return Text(movie.path);
  }






}