import 'dart:io';
import 'package:flutter/material.dart';

class AnotherPage extends StatelessWidget {
  final String title;
  AnotherPage({this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
        elevation: Platform.isAndroid ? 5.0 : 0.0,
      ),
      body: Center(
        child: Text("Content: $title"),
      ),
    );
  }
}