
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:webview_flutter/webview_flutter.dart';

class CameraScreen extends StatelessWidget {
  static final routeName = "CameraScreen";
  CameraScreen() {
  
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        height: 300,
        
        child: 
              WebView(
                initialUrl: 'https://www.youtube.com/watch?v=VBJq2uf6Pt0',
                javaScriptMode: JavaScriptMode.unrestricted,
              )
              //CarView(),
      )
    );
    
      } 
  }
