import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    surface: Colors.white,
    primary: Colors.black,
    secondary: Colors.grey.shade800,
    tertiary: Colors.grey.shade500,
    inversePrimary: Colors.grey.shade100,
    error: Colors.redAccent.shade400,
    errorContainer: const Color(0xFFFFE4E4),
    outline: Colors.greenAccent.shade700,
    surfaceTint: const Color(0xFFE4FFEF),
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
    error: Colors.redAccent.shade200,
    errorContainer: const Color(0xFF330000),
    outline: Colors.greenAccent.shade400,
    surfaceTint: const Color(0xFF00280B),
  ),
);
