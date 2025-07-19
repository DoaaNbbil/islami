import 'package:flutter/material.dart';
import 'package:islam/home_screen.dart';
import 'package:islam/intro/OnboardingScreen.dart';
import 'package:islam/quran/sura_service.dart';
import 'package:islam/quran/suradetails.dart';
import 'package:islam/uitls/routeNames.dart';
import 'package:islam/uitls/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();

  final bool seen = prefs.getBool('onboardingSeen') ?? false;
  await QuranService.getMostRecentlySura();
  runApp(IslamiApp(initialRoute: seen ? AppRoute.home : AppRoute.onboarding));
}

class IslamiApp extends StatelessWidget {
  final String initialRoute;

  const IslamiApp({super.key, required this.initialRoute});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      darkTheme: AppTheme.darkTheme,
      initialRoute: initialRoute,
      routes: {
        AppRoute.home: (_) => HomeScreen(),
        AppRoute.suraDetails: (_) => Suradetails(),
        AppRoute.onboarding: (_) => OnboardingScreen(),
      },
    );
  }
}
