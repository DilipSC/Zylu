import 'package:flutter/material.dart';

class Responsive {
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;

  static double blockWidth = 0;
  static double blockHeight = 0;
  

  static void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenHeight = _mediaQueryData.size.height;
    screenWidth = _mediaQueryData.size.width;

    blockHeight = screenHeight / 100;
    blockWidth = screenWidth / 100;
  }

  static double w(double percent) {
    return blockWidth * percent;
  }

  static double h(double percent) {
    return blockHeight * percent;
  }

  static double sp(double baseSize) {
    return _mediaQueryData.textScaler.scale(baseSize);
  }
}