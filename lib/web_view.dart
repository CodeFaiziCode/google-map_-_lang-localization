import 'package:flutter/material.dart';

class WebView extends StatefulWidget {
  const WebView({super.key});

  @override
  State<WebView> createState() => _WebViewState();
}

class _WebViewState extends State<WebView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text("Web View in Flutter"),
      ),
      body: const Column(
        children: [
          Center(
            child: Text("This paage is for Web View"),
          )
        ],
      ),
    ));
  }
}