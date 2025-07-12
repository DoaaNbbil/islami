// import 'package:flutter/material.dart';
// import 'package:islam/uitls/color.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';
// import 'home_screen.dart';

// class OnboardingScreen extends StatefulWidget {
//   @override
//   _OnboardingScreenState createState() => _OnboardingScreenState();
// }

// class _OnboardingScreenState extends State<OnboardingScreen> {
//   final PageController _controller = PageController();
//   bool onLastPage = false;

//   final List<Map<String, String>> onboardingData = [
//     {
//       'image': 'assets/images/welcom.png',
//       'title': 'Welcome To Islmi App',
//       'desc': '',
//     },
//     {
//       'image': 'assets/images/frame2Welcom.png',
//       'title': 'Welcome To Islami',
//       'desc': 'We Are Very Excited To Have You In Our Community',
//     },
//     {
//       'image': 'assets/images/frame3Welcom.png',
//       'title': 'Reading the Quran',
//       'desc': 'Read, and your Lord is the Most Generous',
//     },
//     {
//       'image': 'assets/images/frame4Welcome.png',
//       'title': 'Bearish',
//       'desc': 'Praise the name of your Lord, the Most High',
//     },
//     {
//       'image': 'assets/images/frame5Welcome.png',
//       'title': 'Holy Quran Radio',
//       'desc':
//           'You can listen to the Holy Quran Radio through the application for free and easily',
//     },
//   ];

//   Future<void> _finishOnboarding() async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setBool('onboardingSeen', true); // توحيد اسم المفتاح
//     Navigator.pushReplacement(
//       context,
//       MaterialPageRoute(builder: (_) => HomeScreen()),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     TextTheme textTheme = Theme.of(context).textTheme;

//     return Scaffold(
//       body: SafeArea(
//         child: Column(
//           children: [
//             Image.asset(
//               'assets/images/header.png',
//               fit: BoxFit.fitWidth,
//               height: MediaQuery.sizeOf(context).height * 0.15,
//             ),
//             Expanded(
//               child: Stack(
//                 children: [
//                   PageView.builder(
//                     controller: _controller,
//                     itemCount: onboardingData.length,
//                     onPageChanged: (index) {
//                       setState(() {
//                         onLastPage = (index == onboardingData.length - 1);
//                       });
//                     },
//                     itemBuilder: (_, index) {
//                       return Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 20.0),
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Image.asset(
//                               onboardingData[index]['image']!,
//                               height: MediaQuery.sizeOf(context).height * 0.4,
//                               width: double.infinity,
//                             ),
//                             const SizedBox(height: 10),
//                             Text(
//                               onboardingData[index]['title']!,
//                               style: textTheme.headlineSmall!.copyWith(
//                                 color: AppColor.primaryColor,
//                               ),
//                               textAlign: TextAlign.center,
//                             ),
//                             const SizedBox(height: 40),
//                             Visibility(
//                               visible:
//                                   onboardingData[index]['desc']!.isNotEmpty,
//                               child: Text(
//                                 onboardingData[index]['desc']!,
//                                 style: textTheme.titleLarge!.copyWith(
//                                   color: AppColor.primaryColor,
//                                 ),
//                                 textAlign: TextAlign.center,
//                               ),
//                             ),
//                           ],
//                         ),
//                       );
//                     },
//                   ),
//                   Positioned(
//                     bottom: 10,
//                     left: 20,
//                     right: 20,
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         onLastPage ||
//                                 _controller.hasClients && _controller.page! > 0
//                             ? GestureDetector(
//                                 onTap: () {
//                                   if (_controller.page! > 0) {
//                                     _controller.previousPage(
//                                       duration: const Duration(
//                                         milliseconds: 500,
//                                       ),
//                                       curve: Curves.easeInOut,
//                                     );
//                                   }
//                                 },
//                                 child: Text(
//                                   'Back',
//                                   style: textTheme.titleMedium!.copyWith(
//                                     color: AppColor.primaryColor,
//                                   ),
//                                 ),
//                               )
//                             : const SizedBox(width: 60),

//                         SmoothPageIndicator(
//                           controller: _controller,
//                           count: onboardingData.length,
//                           effect: ExpandingDotsEffect(
//                             activeDotColor: AppColor.primaryColor,
//                             dotColor: Colors.grey.shade300,
//                             dotHeight: 10,
//                             dotWidth: 10,
//                             expansionFactor: 3,
//                           ),
//                         ),

//                         GestureDetector(
//                           onTap: () {
//                             if (_controller.page! < onboardingData.length - 1) {
//                               _controller.nextPage(
//                                 duration: const Duration(milliseconds: 500),
//                                 curve: Curves.easeInOut,
//                               );
//                             } else {
//                               _finishOnboarding();
//                             }
//                           },
//                           child: Text(
//                             'Next',
//                             style: textTheme.titleMedium!.copyWith(
//                               color: AppColor.primaryColor,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
