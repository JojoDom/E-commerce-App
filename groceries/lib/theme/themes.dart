import 'package:flutter/material.dart';

class Themes {
  static final lightTheme = ThemeData(
    colorScheme: const ColorScheme.light(
      brightness: Brightness.light,
      primary: Colors.yellow,
    ),
  ).copyWith(primaryColor: Colors.yellow,);
  static final darkTheme = ThemeData(colorScheme: const ColorScheme.dark());
}
