import 'package:flutter/material.dart';
import 'package:islam/home_screen.dart';
import 'package:islam/quran/suradetails.dart';
import 'package:islam/uitls/routeNames.dart';
import 'package:islam/uitls/theme.dart';

void main() {
  runApp(const IslamiApp());
}

class IslamiApp extends StatelessWidget {
  const IslamiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        AppRoute.home: (_) => HomeScreen(),
        AppRoute.suraDetails: (_) => Suradetails(),
      },
      initialRoute: AppRoute.home,

      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
    );
  }
}
