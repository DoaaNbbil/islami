import 'package:flutter/material.dart';
import 'package:islam/nav_bar_selected.dart';
import 'package:islam/nav_bar_unselected.dart';
import 'package:islam/tabs/hadethtabs.dart';
import 'package:islam/tabs/qurantabs.dart';
import 'package:islam/tabs/radiotabs.dart';
import 'package:islam/tabs/sebhatabs.dart';
import 'package:islam/tabs/timetabs.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  List<Widget> tabs = [
    QuranTabs(),
    HadethTabs(),
    SebhaTabs(),
    RadioTabs(),
    TimeTabs(),
  ];
  List<String> imageNames = [
    'background_quran',
    'background_hadeth',
    'background_sebha',
    'background_radio',
    'background_time',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/${imageNames[currentIndex]}.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          children: [
            Image.asset(
              'assets/images/header.png',
              fit: BoxFit.fitWidth,
              height: MediaQuery.sizeOf(context).height * 0.15,
            ),
            tabs[currentIndex],
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          if (currentIndex == index) return;
          currentIndex = index;
          setState(() {});
        },
        items: [
          BottomNavigationBarItem(
            icon: NavBarUnselected(nameImage: 'quran'),
            activeIcon: NavBarSelected(nameImage: 'quran'),
            label: 'Quran',
          ),
          BottomNavigationBarItem(
            icon: NavBarUnselected(nameImage: 'hadeth'),
            activeIcon: NavBarSelected(nameImage: 'hadeth'),
            label: 'Hadeth',
          ),
          BottomNavigationBarItem(
            icon: NavBarUnselected(nameImage: 'sebha'),
            activeIcon: NavBarSelected(nameImage: 'sebha'),
            label: 'Sebah',
          ),
          BottomNavigationBarItem(
            icon: NavBarUnselected(nameImage: 'radio'),
            activeIcon: NavBarSelected(nameImage: 'radio'),
            label: 'Radio',
          ),
          BottomNavigationBarItem(
            icon: NavBarUnselected(nameImage: 'time'),
            activeIcon: NavBarSelected(nameImage: 'time'),
            label: 'Time',
          ),
        ],
      ),
    );
  }
}
