import 'package:flutter/material.dart';
import 'package:islam/uitls/color.dart';

class AppTheme {
  static ThemeData LightTheme = ThemeData();
  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColor.blackColor,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColor.blackColor,
      foregroundColor: AppColor.primaryColor,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: AppColor.primaryColor,
      ),
    ),
    primaryColor: AppColor.primaryColor,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColor.primaryColor,
      showUnselectedLabels: false,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: AppColor.whiteColor,
    ),
    textTheme: TextTheme(
      displaySmall: TextStyle(
        color: AppColor.whiteColor,
        fontSize: 36,
        fontWeight: FontWeight.bold,
      ),
      headlineSmall: TextStyle(
        color: AppColor.whiteColor,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
      titleSmall: TextStyle(
        color: AppColor.whiteColor,
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
      titleMedium: TextStyle(
        color: AppColor.whiteColor,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
      titleLarge: TextStyle(
        color: AppColor.whiteColor,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
