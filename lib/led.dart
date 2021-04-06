import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'gloabals.dart';

class Led extends StatefulWidget {
  @override
  _LedState createState() => _LedState();
}

class _LedState extends State<Led> {
  List<bool> _selections = List.generate(2, (_) => false);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ToggleButtons(
      children: <Widget>[
        Icon(Icons.lightbulb_outline),
        Icon(Icons.lightbulb),
      ],
      isSelected: _selections,
      onPressed: (int index) {
        setState(() {
          for (int buttonIndex = 0;
              buttonIndex < _selections.length;
              buttonIndex++) {
            if (buttonIndex == index) {
              _selections[buttonIndex] = true;
            } else {
              _selections[buttonIndex] = false;
            }
          }
          // _selections[index] = !_selections[index];
        });
        oncall(index);
      },
    ));
  }

  void oncall(int input) async {
    String command = input == 1 ? "redledon" : "redledoff";
    String value = input == 1 ? "255" : "0";
    print("URL:" + Globals.url.toString());
    var url = Uri.parse(Globals.url +
        '/control/move?command=' +
        command +
        '&value=' +
        value +
        '');

    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    // print(await http.read('https://example.com/foobar.txt'));
  }
}
