import 'package:flutter/material.dart';
import 'package:meditate/screens/login_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Meditate App",
      theme: ThemeData(
        fontFamily: "Poppins",
        primaryColor: Colors.green[800],
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginPage(),
    );
  }
}