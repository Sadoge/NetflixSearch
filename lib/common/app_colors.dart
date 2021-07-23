import 'dart:ui';

import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const Color whiteRock = Color(0xFFEEEBDD);
  static const Color maroon = Color(0xFF810000);
  static const Color roseWood = Color(0xFF630000);
  static const Color codGrey = Color(0xFF1B1717);
}

List<int> colorPaletteIndices = [
  50,
  100,
  200,
  300,
  400,
  500,
  600,
  700,
  800,
  900
];

MaterialColor getMaterialColor(Color color) {
  List strengths = <double>[0.05];
  final swatch = <int, Color>{};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1, len = 9; i <= len; i++) {
    strengths.add(0.1 * i);
  }

  strengths.forEach((strength) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1);
  });

  return MaterialColor(color.value, swatch);
}
