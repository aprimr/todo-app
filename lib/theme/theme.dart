import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    surface: Colors.white,
    primary: Colors.black,
    secondary: Colors.grey.shade800,
    tertiary: Colors.grey.shade500,
    inversePrimary: Colors.grey.shade100,
    error: Colors.red,
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
    error: const Color(0xFFFF3434),
  ),
);
