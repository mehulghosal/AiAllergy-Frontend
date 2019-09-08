import 'dart:async';
import 'dart:io';
import 'dart:convert';

import 'allergens.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' show join;
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;

class Evaluate extends StatefulWidget {
  final CameraDescription camera;

  const Evaluate({
    Key key,
    @required this.camera,
  }) : super(key: key);

  @override
  EvaluateState createState() => EvaluateState();
}

class EvaluateState extends State<Evaluate> {
  CameraController _controller;
  Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    _controller = CameraController(
      widget.camera,
      ResolutionPreset.medium,
    );
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return CameraPreview(_controller);
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.camera_alt),
        onPressed: () async {
          try {
            await _initializeControllerFuture;
            final path = join(
              (await getTemporaryDirectory()).path,
              '${DateTime.now()}.png',
            );

            // Attempt to take a picture and log where it's been saved.
            await _controller.takePicture(path);

            // If the picture was taken, display it on a new screen.
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DisplayPictureScreen(imagePath: path),
              ),
            );
          } catch (e) {
            print(e);
          }
        },
      ),
    );
  }
}

class DisplayPictureScreen extends StatelessWidget {
  final String imagePath;
  const DisplayPictureScreen({Key key, this.imagePath}) : super(key: key);

  Future<String> upload(File imageFile) async {
    List<int> imageBytes = imageFile.readAsBytesSync();
    String base64Image = base64.encode(imageBytes);
//    print(base64Image);
    var url = "aillergy.tech/abc";
    http.Response res =  await http.post(url, body: {"image":base64Image/*, "allergens": allergens*/});
    return res.body;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: <Widget>[
            Image.file(File(imagePath)),
            Container (
              child: ButtonTheme (
                height: 110.0,
                minWidth: 300.0,
                child: RaisedButton(
                  onPressed: () {
                    File imageFile = new File(imagePath);
                    var body = upload(imageFile);
                  },
                  color: Color(0xFFACECD5),
                  child: const Text('Evaluate', style: TextStyle(fontSize: 40, fontFamily: 'Open Sans', fontWeight: FontWeight.w400,)),
                  shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(20.0)),
                ),
              ),
              alignment: new Alignment(0,0.9)
            ),
          ],
        ),
    );
  }
}