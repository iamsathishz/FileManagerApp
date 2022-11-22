import 'package:flutter/material.dart';

enum AppThemeKey { light, dark }

class AppThemeConstant {
  static const Color lightPrimary = Color(0xfff3f4f9);
  static const Color darkPrimary = Color(0xff1f1f1f);
  static const Color lightAccent = Color(0xff597ef7);
  static const Color darkAccent = Color(0xff597ef7);
  static const Color lightBG = Color(0xfff3f4f9);
  static const Color darkBG = Color(0xff121212);
  static Color backgroundSmokeWhite = const Color(0xffB0C6D0).withOpacity(0.1);
}

final Map<AppThemeKey, ThemeData> appThemeConfig = {
  AppThemeKey.light: ThemeData(
    backgroundColor: AppThemeConstant.lightBG,
    primaryColor: AppThemeConstant.lightPrimary,
    scaffoldBackgroundColor: AppThemeConstant.lightBG,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      color: AppThemeConstant.lightPrimary,
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.w800,
      ),
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
    ),
    colorScheme: ColorScheme.fromSwatch()
        .copyWith(secondary: AppThemeConstant.lightAccent),
  ),
  AppThemeKey.dark: ThemeData(
    brightness: Brightness.dark,
    backgroundColor: AppThemeConstant.darkBG,
    primaryColor: AppThemeConstant.darkPrimary,
    scaffoldBackgroundColor: AppThemeConstant.darkBG,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      color: AppThemeConstant.darkPrimary,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.w800,
      ),
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),
    colorScheme: ColorScheme.fromSwatch()
        .copyWith(secondary: AppThemeConstant.darkAccent),
  )
};
