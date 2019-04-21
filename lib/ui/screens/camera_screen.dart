

import 'package:flutter/material.dart';

class CameraScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {

    return _CameraScreen();
  }

}

class _CameraScreen extends State<CameraScreen>{
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
      ),
      body: Text("CameraScreen"),

    );
  }

}