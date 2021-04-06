import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'firstscreen.dart';

class InitialDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 2500), () {
      Navigator.of(context).pushNamed(FirtScreen.routeName);
      // Navigator.of(context).pushNamed(CameraScreen.routeName);
    });

    return Scaffold(
      body: Container(
          decoration: BoxDecoration(color: Colors.white),
          child: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Image(image: AssetImage('assets/images/car.png')),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Lets Run our Car :) ',
                    style: TextStyle(color: Colors.blue)),
              ),
            ]),
          )),
    );
  }

  Text headingText(String data) {
    return Text(data,
        style: TextStyle(
          fontSize: 20,
          color: Colors.white,
          wordSpacing: 2,
        ));
  }
}
