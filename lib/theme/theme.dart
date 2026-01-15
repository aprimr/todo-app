import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    surface: Colors.white,
    primary: Colors.black,
    secondary: Colors.grey.shade800,
    tertiary: Colors.grey.shade500,
    inversePrimary: Colors.grey.shade100,
  ),
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    surface: Colors.black,
    primary: Colors.white,
    secondary: Colors.grey.shade300,
    tertiary: Colors.grey.shade500,
    inversePrimary: Colors.grey.shade900,
  ),
);
