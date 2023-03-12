import 'package:flutter/material.dart';

final ThemeData lightTheme = ThemeData(
    listTileTheme: ListTileThemeData(
      iconColor: Colors.black,
    ),
    brightness: Brightness.light,
    colorScheme: const ColorScheme.light(primary: Colors.black),
    // primarySwatch: Colors.white,
    primaryColor: Colors.black,
    backgroundColor: Colors.white,
    iconTheme: const IconThemeData(color: Colors.black),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
    ),
    textTheme: TextTheme());

final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primarySwatch: Colors.grey,
    textTheme: const TextTheme(
        bodyLarge: TextStyle(
      color: Colors.white,
    )),
    cardTheme: const CardTheme(color: Colors.blue),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Colors.grey,
    ));
