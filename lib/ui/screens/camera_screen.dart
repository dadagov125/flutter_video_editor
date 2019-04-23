import 'dart:async';
import 'dart:io';
import 'package:camera/camera.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:video_editot/repositories/file_repository.dart';

class CameraScreen extends StatefulWidget {
  @override
  createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  CameraController controller;

  @override
  void initState() {
    initCamera();
    super.initState();
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var isInitialized = controller?.value?.isInitialized;

    if (isInitialized == null || !isInitialized) {
      return Container();
    }

    return SafeArea(
      child: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              child: AspectRatio(
                aspectRatio: controller.value.aspectRatio,
                child: CameraPreview(controller),
              ),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.all(Radius.circular(3)),
                border: Border.all(
                  color: controller != null && controller.value.isRecordingVideo
                      ? Colors.red
                      : Colors.grey,
                  width: 2.0,
                ),
              ),
            ),
          ),
          Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.all(Radius.circular(50.0)),
              onTap: () {
                !controller.value.isRecordingVideo
                    ? startRecord()
                    : stopRecord();
              },
              child: Container(
                padding: EdgeInsets.all(4.0),
                child: controller.value.isRecordingVideo
                    ? Icon(
                        Icons.stop,
                        color: Colors.red,
                        size: 64,
                      )
                    : Icon(
                        Icons.fiber_manual_record,
                        color: Colors.red,
                        size: 64,
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void initCamera() async {
    controller?.dispose();

    var cameras = await availableCameras();

    controller = CameraController(cameras[1], ResolutionPreset.high);

    controller.addListener(() {
      if (mounted) setState(() {});
    });

    controller.initialize();
  }

  void startRecord() async {
    if (!controller.value.isInitialized || controller.value.isRecordingVideo) {
      return null;
    }

    var fileRepo = FileRepository();

    var moviesDir = await fileRepo.getMoviesDir();

    final String filePath =
        '${moviesDir.path}/${DateTime.now().microsecondsSinceEpoch.toString()}.mp4';

    controller.startVideoRecording(filePath).then((_) {
      if (mounted) setState(() {});
    });
  }

  void stopRecord() async {
    if (controller.value.isRecordingVideo) {
      controller.stopVideoRecording().then((_) {
        if (mounted) setState(() {});

        Navigator.pop(context);
      });
    }
  }
}
