import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Wview extends StatelessWidget {
  final String url="https://www.google.com/maps/place/Bali/@-8.4556974,114.5110582,9z/data=!3m1!4b1!4m5!3m4!1s0x2dd22f7520fca7d3:0x2872b62cc456cd84!8m2!3d-8.3405389!4d115.0919509";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(url),
        centerTitle: true,
        bottom: PreferredSize(
          child: Container(
            color:Colors.purple[500],
            height: 4.0,
          ),
          preferredSize: null
        ),
      ),
      body: WebView(
        initialUrl: url,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}