import 'package:car_remote/carview.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:webview_flutter/webview_flutter.dart';

class FirtScreen extends StatelessWidget {
  static final routeName = "firstScreen";
  FirtScreen() {
    /* FlutterBlue flutterBlue = FlutterBlue.instance;
    // Start scanning
    flutterBlue.startScan(timeout: Duration(seconds: 4));

// Listen to scan results
    var subscription = flutterBlue.scanResults.listen((results) {
      // do something with scan results
      for (ScanResult r in results) {
        print('${r.device.name} found! rssi: ${r.rssi}');
      }
    });

// Stop scanning
    flutterBlue.stopScan();*/
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
              /*WebView(
                initialUrl: 'https://www.youtube.com/embed/abc',
                javaScriptMode: JavaScriptMode.unrestricted,
              ),*/
              //CarView(),
              Padding(
                padding: const EdgeInsets.only(bottom: 150),
              ),
              SizedBox(
                width: 120,
                child: RaisedButton(
                    color: Colors.yellow[700],
                    textColor: Colors.white,
                    child: Text('Login'),
                    onPressed: () {}),
              ),
              SizedBox(
                width: 120,
                child: RaisedButton(
                    color: Colors.yellow[700],
                    textColor: Colors.white,
                    child: Text('call'),
                    onPressed: () {
                      oncall();
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void oncall() async {
    print('HELOOOOOO');
    var url = Uri.parse('http://127.0.0.1:8080/control/move?command=reverse');
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    // print(await http.read('https://example.com/foobar.txt'));
  }
}
