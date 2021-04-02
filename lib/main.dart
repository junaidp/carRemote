import 'package:car_remote/firstscreen.dart';
import 'package:flutter/material.dart';

import 'InitialDisplay.dart';
import 'cameraScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Remote Car',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: InitialDisplay(),
        routes: {
          FirtScreen.routeName: (ctx) => FirtScreen(),
          CameraScreen.routeName: (ctx) => CameraScreen()
        });
  }
}
