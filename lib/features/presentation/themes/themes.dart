import 'package:flutter/material.dart';
import 'package:stockify/features/presentation/themes/styles.dart';

class AppThemes {
  static ThemeData themeData =
      ThemeData(colorScheme: colorScheme, tabBarTheme: tabBarTheme);
  static ColorScheme colorScheme = const ColorScheme(
      brightness: Brightness.dark,
      shadow: Colors.white,
      tertiary: Colors.pinkAccent,
      primary: Colors.black,
      onPrimary: Colors.white,
      secondary: Colors.green,
      onSecondary: Colors.black,
      error: Colors.white,
      onError: Colors.red,
      onSecondaryContainer: Colors.grey,
      primaryContainer: Color.fromARGB(255, 50, 50, 50),
      surface: Color.fromARGB(255, 4, 4, 4),
      onSurface: Colors.white);
//----------------tabbar theme---------------------
  static TabBarTheme tabBarTheme = TabBarTheme(
    indicatorSize: TabBarIndicatorSize.tab,
    labelColor: Colors.white,
    dividerHeight: 0.0,
    indicatorColor: Colors.transparent,
    indicator: Styles.gradiantStyle,
  );
}
