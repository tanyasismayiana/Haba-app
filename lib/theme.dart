import 'package:flutter/material.dart';

final lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white, brightness: Brightness.light);

final darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.black,
    primaryColor: Colors.amber,
    textTheme: ThemeData.dark().textTheme,
    brightness: Brightness.dark,
    cardColor: Colors.black);
