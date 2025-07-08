import 'dart:math';
import 'package:flutter/material.dart';
import 'package:islam/uitls/color.dart';

class SebhaTabs extends StatefulWidget {
  @override
  _SebhaTabsState createState() => _SebhaTabsState();
}

class _SebhaTabsState extends State<SebhaTabs> {
  int count = 0;
  double angle = -pi / 2;
  List<String> azkar = [
    'سبحان الله',
    'الحمد لله',
    'الله أكبر',
    'لا إله إلا الله',
  ];

  List<String> azkarTitles = [
    'سَبِّحِ اسْمَ رَبِّكَ الأعلى',
    'وَقُلِ ٱلْحَمْدُ لِلَّهِ',
    'وَكَبِّرْهُ تَكْبِيرًۭا',
    'فَاعْلَمْ أَنَّهُۥ لَآ إِلَـٰهَ إِلَّا ٱللَّهُ',
  ];

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    int currentZikrIndex = (count ~/ 30) % azkar.length;
    String currentZikr = azkar[currentZikrIndex];
    String currentTitle = azkarTitles[currentZikrIndex];

    double radius = 100;
    double offset = 50;

    double dx = (radius + offset) * cos(angle);
    double dy = (radius + offset) * sin(angle);

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          currentTitle,
          textAlign: TextAlign.center,
          style: textTheme.displaySmall?.copyWith(color: AppColor.whiteColor),
        ),
        Stack(
          alignment: Alignment.center,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  count++;
                  angle += pi / 15;
                });
              },
              child: Container(
                width: 2 * radius + 100,
                height: 2 * radius + 100,
                margin: EdgeInsets.only(top: 70),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.contain,
                    image: AssetImage('assets/images/sebhabody.png'),
                  ),
                ),
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      currentZikr,
                      style: textTheme.displaySmall?.copyWith(
                        color: AppColor.whiteColor,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      '$count',
                      style: textTheme.displaySmall?.copyWith(
                        color: AppColor.whiteColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Transform.translate(
              offset: Offset(dx, dy),
              child: Image.asset('assets/images/sebhaheader.png'),
            ),
          ],
        ),
      ],
    );
  }
}
