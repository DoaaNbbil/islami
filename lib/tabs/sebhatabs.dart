import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islam/uitls/color.dart';

class SebhaTabs extends StatefulWidget {
  @override
  _SebhaTabsState createState() => _SebhaTabsState();
}

class _SebhaTabsState extends State<SebhaTabs>
    with SingleTickerProviderStateMixin {
  int count = 0;
  double angle = 0;
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
    Size screenSize = MediaQuery.sizeOf(context);

    int currentZikrIndex = (count ~/ 30) % azkar.length;
    String currentZikr = azkar[currentZikrIndex];
    String currentTitle = azkarTitles[currentZikrIndex];

    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text(
            currentTitle,
            textAlign: TextAlign.center,
            style: textTheme.displaySmall?.copyWith(color: AppColor.whiteColor),
          ),
          SizedBox(height: screenSize.height * 0.05),
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Image.asset('assets/images/sebhaheader.png'),
              Padding(
                padding: EdgeInsets.only(top: screenSize.height * 0.08),
                child: SizedBox(
                  width: screenSize.width * 0.85,
                  child: GestureDetector(
                    onTap: () {
                      HapticFeedback.lightImpact();
                      setState(() {
                        count++;
                        angle += 45;
                      });
                    },
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Transform.rotate(
                          angle: angle,
                          child: Image.asset('assets/images/sebhabody.png'),
                        ),

                        SizedBox(
                          width: screenSize.width * 0.4,

                          child: Column(
                            children: [
                              Text(
                                currentZikr,
                                style: textTheme.displaySmall?.copyWith(
                                  color: AppColor.whiteColor,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 16),
                              Text(
                                '$count',
                                style: textTheme.displaySmall!.copyWith(
                                  color: AppColor.whiteColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
