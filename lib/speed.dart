import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Speed extends StatefulWidget {
  @override
  _SpeedState createState() => _SpeedState();
}

class _SpeedState extends State<Speed> {
  double currentSliderValue = 0;

  @override
  Widget build(BuildContext context) {
    return Transform(
        alignment: FractionalOffset.center,
        // Rotate sliders by 90 degrees
        transform: new Matrix4.identity()..rotateZ(90 * 3.1415927 / 180),
        child: Slider(
          
          value: currentSliderValue,
          min: -255,
          max: 255,
          divisions: 2,
          label: currentSliderValue.round().toString(),
          onChanged: (double value) {
            setState(() {
              currentSliderValue = value;
              oncall(value);
            });
          },
        ));
  }

  double getValue() {
    return currentSliderValue;
  }

  void oncall(double value) async {
    String movement = value > 0 ? "forward" : "reverse";
    double speed = value > 0 ? value : 255 + value;

    var url = Uri.parse('http://127.0.0.1:8080/control/move?command=' +
        movement +
        '&value=' +
        speed.toString() +
        '');
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    // print(await http.read('https://example.com/foobar.txt'));
  }
}
