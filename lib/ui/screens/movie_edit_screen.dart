import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:video_editot/repositories/file_repository.dart';
import 'package:video_player/video_player.dart';

class MovieEditScreen extends StatefulWidget {
  static final String routeName = "movie_edit";

  String movieThumbnailPath;

  MovieEditScreen(this.movieThumbnailPath);

  @override
  State<StatefulWidget> createState() {
    return _MovieEditScreenState();
  }
}

class _MovieEditScreenState extends State<MovieEditScreen> {
  VideoPlayerController _controller;
  bool _isPlaying = false;
  Duration _duration;
  Duration _position;

  Duration _from;
  Duration _ro;
  bool _isEnd = false;

  @override
  void initState() {
    super.initState();

    var movieThumbnailPath = widget.movieThumbnailPath;

    movieThumbnailPath = movieThumbnailPath
        .replaceFirst(".jpg", ".mp4")
        .replaceFirst("/thumbnails/", "/movies/");

    var file = File(movieThumbnailPath);

    _controller = VideoPlayerController.file(file)
      ..addListener(() {
        final bool isPlaying = _controller.value.isPlaying;
        if (isPlaying != _isPlaying) {
          setState(() {
            _isPlaying = isPlaying;
          });
        }
        _position = _controller.value.position;
        setState(() {
          _duration = _controller.value.duration;
        });
        _duration?.compareTo(_position) == 0 ||
                _duration?.compareTo(_position) == -1
            ? this.setState(() {
                _isEnd = true;
                if (_controller.value.isPlaying) {
                  _controller.pause();
                  _isPlaying = false;
                  _controller.seekTo(Duration(seconds: 0));
                }
              })
            : this.setState(() {
                _isEnd = false;
              });
      })
      ..initialize().then((_) {
        if (mounted) setState(() {});
      });
  }

  @override
  void dispose() {
    super.dispose();
    _controller?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
          child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 5, left: 5, right: 5),
            height: 300,
            width: double.infinity,
            child: AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: VideoPlayer(_controller),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 5, right: 5),
            child: VideoProgressIndicator(
              _controller,
              allowScrubbing: true,
            ),
          )
        ],
      )),
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(bottom: 5),
        child: FloatingActionButton(
          onPressed: () {
            setState(() {
              _isPlaying ? _controller.pause() : _controller.play();
            });
          },
          child: Icon(
            _isPlaying ? Icons.pause : Icons.play_arrow,
          ),
        ),
      ),
    );
  }
}
