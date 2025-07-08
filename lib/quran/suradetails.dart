import 'package:flutter/material.dart';
import 'package:islam/quran/sura.dart';
import 'package:islam/uitls/color.dart';

class Suradetails extends StatelessWidget {
  const Suradetails({super.key});

  @override
  Widget build(BuildContext context) {
    double heigthScreen = MediaQuery.sizeOf(context).height;
    TextTheme textTheme = Theme.of(context).textTheme;
    Sura sura = ModalRoute.of(context)!.settings.arguments as Sura;
    return Scaffold(
      appBar: AppBar(title: Text(sura.englishNames)),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  'assets/images/left_details_sura.dart.png',
                  height: heigthScreen * 0.1,
                  fit: BoxFit.fill,
                ),
                Text(
                  sura.arabicNames,
                  style: textTheme.headlineSmall?.copyWith(
                    color: AppColor.primaryColor,
                  ),
                ),
                Image.asset(
                  'assets/images/right_detalis_sura.png',
                  height: heigthScreen * 0.1,
                  fit: BoxFit.fill,
                ),
              ],
            ),
          ),
          Spacer(),
          Image.asset(
            'assets/images/bottom_details_sura.png',
            width: double.infinity,
            fit: BoxFit.fill,
          ),
        ],
      ),
    );
  }
}
