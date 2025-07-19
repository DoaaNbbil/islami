import 'package:flutter/material.dart';
import 'package:islam/quran/sura.dart';
import 'package:islam/uitls/color.dart';
import 'package:islam/uitls/routeNames.dart';

class MostRecentlyItems extends StatelessWidget {
  Sura sura;
  MostRecentlyItems(this.sura);

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    Size screenSize = MediaQuery.sizeOf(context);
    return InkWell(
      onTap: () => Navigator.of(
        context,
      ).pushNamed(AppRoute.suraDetails, arguments: sura),
      child: Container(
        height: double.infinity,
        width: screenSize.width * 0.7,
        padding: EdgeInsets.only(left: 12, right: 8),

        decoration: BoxDecoration(
          color: AppColor.primaryColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  sura.englishNames,
                  style: textTheme.headlineSmall!.copyWith(
                    color: AppColor.blackColor,
                  ),
                ),
                Text(
                  sura.arabicNames,
                  style: textTheme.titleLarge!.copyWith(
                    color: AppColor.blackColor,
                  ),
                ),
                Text(
                  '${sura.ayaNumber} Verses',
                  style: textTheme.titleSmall!.copyWith(
                    color: AppColor.blackColor,
                  ),
                ),
              ],
            ),
            Image.asset(
              'assets/images/mostRecently.png',
              width: screenSize.width * 0.3,
              height: screenSize.height * 0.14,
            ),
          ],
        ),
      ),
    );
  }
}
