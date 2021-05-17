import 'package:flutter/material.dart';
import 'dart:math';

class Utils {
  static String assetPath(name) {
    return "assets/images/$name";
  }

  static Size getScreenSize(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  static double toRadian({double degree}) {
    return degree * pi / 180.0;
  }

  static double toDegree({double radian}) {
    return radian * 180.0 / pi;
  }
}