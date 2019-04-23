import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:flutter_ffmpeg/flutter_ffmpeg.dart';

class FileService {
  String _moviesFolder = "movies";

  String _thumbnailsFolder="thumbnails";

  List<String> _moviesExtensions = [".mp4"];

  bool isMovie(String path) => _moviesExtensions.contains(p.extension(path));

  Future<Directory> getMoviesDir() async {
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
      return await (await Directory(path).delete()).exists();
    }
    return false;
  }

  Future<List<FileSystemEntity>> getMovieThumbnails() async{
    var appDir = await getApplicationDocumentsDirectory();
    var moviesThumbnailsDir = Directory('${appDir.path}/$_thumbnailsFolder');
    if (!await moviesThumbnailsDir.exists()) {
      await moviesThumbnailsDir.create(recursive: true);
    }

    return  moviesThumbnailsDir.list().where((file){
      return p.extension(file.path)==".jpg";
    }).toList();

  }

  void createMovieThumbnail(String moviePath) async {

    var appDir = await getApplicationDocumentsDirectory();

    var moviesThumbnailsDir = Directory('${appDir.path}/$_thumbnailsFolder');

    if (!await moviesThumbnailsDir.exists()) {
      await moviesThumbnailsDir.create(recursive: true);
    }

    var movieName = p.basenameWithoutExtension(moviePath);

    var thumbnailPath = '${moviesThumbnailsDir.path}/${movieName}.jpg';

    var ffmpeg = new FlutterFFmpeg();

    await ffmpeg
        .execute('-i ${moviePath} -ss 00:00:01 -vframes 1 ${thumbnailPath}');

    var list = await moviesThumbnailsDir.list(recursive: true).toList();

    list.length;
  }
}
