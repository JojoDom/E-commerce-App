import 'package:flutter/material.dart';

class Themes {
  static final lightTheme = ThemeData(
    colorScheme: const ColorScheme.light(
      brightness: Brightness.light,
      primary: Color(0xFF81c784),
    ),
    // primaryColor: const Color(0xFF81c784),
  );
  // .copyWith(
  //  primaryColor: const Color(0xFF81c784),
  // );

  static final darkTheme = ThemeData(colorScheme: const ColorScheme.dark());
}
