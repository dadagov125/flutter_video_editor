import 'dart:io';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:path/path.dart' as p;

class MovieListItem extends StatelessWidget {
  FileSystemEntity movieThumbnail;

  VideoPlayerController _controller;

  MovieListItem({@required this.movieThumbnail}) {
    _controller = VideoPlayerController.file(File(movieThumbnail.path))
      ..initialize();
  }

  @override
  Widget build(BuildContext context) {
    var image = Image(image: FileImage(File(movieThumbnail.path)));

    var createdDate = DateTime.fromMillisecondsSinceEpoch(
        int.parse(p.basenameWithoutExtension(movieThumbnail.path)));

    var createdText = DateFormat('yyyy/MM/dd  kk:mm').format(createdDate);

    return GestureDetector(
      child: AspectRatio(
        aspectRatio: _controller.value.aspectRatio,
        child: Container(
          margin: EdgeInsets.all(5),
          height: image.height,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: FileImage(File(movieThumbnail.path)), fit: BoxFit.fill),
          ),
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              padding: EdgeInsets.only(left: 5, bottom: 5),
              child: Text(
                createdText,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ),
      ),

      onTap: (){
        Navigator.pushNamed(context, "movie_edit");
      },
    );
  }
}
