import 'package:aiallergy_front/allergens.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'about.dart';
import 'dashboard.dart';
import 'evaluate.dart';
import 'home.dart';
import 'emergency.dart';

CameraDescription firstCamera;
Future<void> main() async {
  final cameras = await availableCameras();
  firstCamera = cameras.first;
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'AiAllergy',
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
          primaryColorLight: const Color(0xFFB19CD9),
          primaryColorDark: const Color(0xFF167F67),
          primaryColor: const Color(0xFF1853a5),
          accentColor: Colors.white,
          errorColor: const Color(0xFFFFAD32),

          textSelectionColor: const Color(0xFF382618),
          hintColor: const Color(0xFFAEAEAE),
          bottomAppBarColor: Colors.transparent,
      ),
      initialRoute: '/',
      routes: {
        '/': (_) => new Dashboard(),
        '/home': (_) => new Home(),
        '/about': (_) => new About(),
        '/allergens': (_) => new Allergens(),
        '/evaluate': (_) => new Evaluate(camera: firstCamera),
//        '/results': (_) => new Results(data: ),
        '/emergency': (_) => new Emergency(),

      },
    );
  }
}