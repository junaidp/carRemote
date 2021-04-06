import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'gloabals.dart';

class Turn extends StatefulWidget {
  @override
  _TurnState createState() => _TurnState();
}

class _TurnState extends State<Turn> {
  double currentSliderValue = 20;
  @override
  Widget build(BuildContext context) {
     return Slider(
      value: currentSliderValue,
      min: -255,
      max: 255,
      divisions: 5,
      label: currentSliderValue.round().toString(),
      onChanged: (double value) {
        setState(() {
          currentSliderValue = value;
          oncall(value);
        });
      },
    );
  }

   void oncall(double value) async {
    String turn = value > 0 ? "right" : "left";
    double speed = value > 0 ? value : 255 + value;

    var url = Uri.parse(Globals.url+'/control/move?command=' +
        turn +
        '&value=' +
        speed.toString() +
        '');
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    // print(await http.read('https://example.com/foobar.txt'));
  }
}