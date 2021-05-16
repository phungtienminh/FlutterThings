import 'package:flash_gym/screens/login_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flash Gym",
      theme: ThemeData(
        primaryColor: Colors.redAccent,
        secondaryHeaderColor: Color.fromRGBO(231, 174, 245, 0.4),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginPage(),
    );
  }
}