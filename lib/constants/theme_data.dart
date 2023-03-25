import 'package:flutter/material.dart';

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  useMaterial3: true,
  appBarTheme: const AppBarTheme(color: Colors.white),
  iconTheme: const IconThemeData(
    color: Colors.black,
  ),
  colorScheme: ColorScheme(
    primary: Colors.grey.shade400,
    brightness: Brightness.light,
    background: Colors.white,
    onSurface: Colors.black,
    surface: Colors.black,
    onPrimary: Colors.white,
    secondary: Colors.grey.shade400,
    onSecondary: Colors.grey.shade500,
    error: Colors.white,
    onError: Colors.white,
    onBackground: Colors.white,
  ),
  bottomNavigationBarTheme:
    const BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: Colors.black,
    ),
);

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  iconTheme: const IconThemeData(
    color: Colors.white,
  ),
  colorScheme: const ColorScheme(
    primary: Colors.black,
    brightness: Brightness.dark,
    background: Colors.black,
    onSurface: Colors.white,
    surface: Colors.black,
    onPrimary: Colors.black,
    secondary: Colors.grey,
    onSecondary: Colors.black,
    error: Colors.red,
    onError: Colors.red,
    onBackground: Colors.black,
  ),
  appBarTheme: const AppBarTheme(color: Colors.black),
  scaffoldBackgroundColor: Colors.black,
  bottomNavigationBarTheme:
      const BottomNavigationBarThemeData(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
      ),
  useMaterial3: true,
);
