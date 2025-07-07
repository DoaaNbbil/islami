import 'package:flutter/material.dart';
import 'package:islam/uitls/color.dart';

class AppTheme {
  static ThemeData LightTheme = ThemeData();
  static ThemeData darkTheme = ThemeData(
    primaryColor: AppColor.primaryColor,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColor.primaryColor,
      showUnselectedLabels: false,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: AppColor.whiteColor,
    ),
  );
}
