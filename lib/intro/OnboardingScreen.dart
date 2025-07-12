import 'package:flutter/material.dart';
import 'package:islam/home_screen.dart';
import 'package:islam/intro/OnboardingNavigation.dart';
import 'package:islam/intro/OnboardingPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  bool onLastPage = false;

  final List<Map<String, String>> onboardingData = [
    {
      'image': 'assets/images/welcom.png',
      'title': 'Welcome To Islmi App',
      'desc': '',
    },
    {
      'image': 'assets/images/frame2Welcom.png',
      'title': 'Welcome To Islami',
      'desc': 'We Are Very Excited To Have You In Our Community',
    },
    {
      'image': 'assets/images/frame3Welcom.png',
      'title': 'Reading the Quran',
      'desc': 'Read, and your Lord is the Most Generous',
    },
    {
      'image': 'assets/images/frame4Welcome.png',
      'title': 'Bearish',
      'desc': 'Praise the name of your Lord, the Most High',
    },
    {
      'image': 'assets/images/frame5Welcome.png',
      'title': 'Holy Quran Radio',
      'desc':
          'You can listen to the Holy Quran Radio through the application for free and easily',
    },
  ];

  Future<void> _finishOnboarding() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('onboardingSeen', true);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => HomeScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Image.asset(
              'assets/images/header.png',
              fit: BoxFit.fitWidth,
              height: MediaQuery.sizeOf(context).height * 0.15,
            ),
            Expanded(
              child: Stack(
                children: [
                  PageView.builder(
                    controller: _controller,
                    itemCount: onboardingData.length,
                    onPageChanged: (index) {
                      setState(() {
                        onLastPage = (index == onboardingData.length - 1);
                      });
                    },
                    itemBuilder: (_, index) {
                      final page = onboardingData[index];
                      return OnboardingPage(
                        image: page['image']!,
                        title: page['title']!,
                        description: page['desc']!,
                      );
                    },
                  ),
                  Positioned(
                    bottom: 10,
                    left: 20,
                    right: 20,
                    child: OnboardingNavigation(
                      onLastPage: onLastPage,
                      controller: _controller,
                      finishOnboarding: _finishOnboarding,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
