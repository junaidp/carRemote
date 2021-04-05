import 'package:car_remote/led.dart';
import 'package:car_remote/speed.dart';
import 'package:car_remote/turn.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:webview_flutter/webview_flutter.dart';

class FirtScreen extends StatelessWidget {
  static final routeName = "firstScreen";
  Speed speed;
  FirtScreen() {
    speed = new Speed();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Container(
                  height:500,
                  child: WebView(
                    initialUrl: 'http://192.168.178.56/',
                    javaScriptMode: JavaScriptMode.unrestricted,
                  ),
                ),
              ),
             Padding(
                padding: const EdgeInsets.only(bottom: 110),
              ),
              SizedBox(child: speed, width: 300,),
               
            Turn(),
              Padding(
                padding: const EdgeInsets.only(top: 35),
                child: Led()
              ),
            ],
          ),
        ),
      ),
    );
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
