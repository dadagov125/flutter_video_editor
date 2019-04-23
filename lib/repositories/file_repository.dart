import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;




class FileRepository {
  String _moviesFolder = "movies";

  List<String> _moviesExtensions = [".mp4"];

  bool isMovie(String path) => _moviesExtensions.contains(p.extension(path));
  
  Future<Directory> getMoviesDir() async{

    var dir = await getApplicationDocumentsDirectory();

    var moviesDir = Directory('${dir.path}/${_moviesFolder}');

    if (!await moviesDir.exists()) {
      await moviesDir.create(recursive: true);
    }
    return moviesDir;
  }

  Future<List<FileSystemEntity>> getMovies() async {

    var moviesDir = await getMoviesDir();

    if (!await moviesDir.exists()) {
      await moviesDir.create(recursive: true);
    }
    var moviesList = await moviesDir.list().where((file) {
      return (file.statSync().type == FileSystemEntityType.file) &&
          isMovie(file.path);
    }).toList();

    return moviesList;
  }

  Future<bool> removeMovie(String path) async {
    if (isMovie(path)) {
     return  await (await Directory(path).delete()).exists();
    }
    return false;
  }
}
