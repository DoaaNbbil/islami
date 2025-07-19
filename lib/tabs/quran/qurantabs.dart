import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islam/tabs/quran/mostRecentiy.dart';
import 'package:islam/tabs/quran/sura.dart';
import 'package:islam/tabs/quran/sura_item.dart';
import 'package:islam/tabs/quran/sura_service.dart';
import 'package:islam/uitls/color.dart';
import 'package:islam/uitls/routeNames.dart';

class QuranTabs extends StatefulWidget {
  @override
  State<QuranTabs> createState() => _QuranTabsState();
}

class _QuranTabsState extends State<QuranTabs> {
  @override
  Widget build(BuildContext context) {
    double mediaQueryWidth = MediaQuery.sizeOf(context).width;
    TextTheme textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: TextField(
            style: textTheme.titleMedium,
            decoration: InputDecoration(
              hintText: 'Sura Name',
              prefixIcon: SvgPicture.asset(
                'assets/icons/quran.svg',
                colorFilter: ColorFilter.mode(
                  AppColor.primaryColor,
                  BlendMode.srcIn,
                ),
                width: 28,
                height: 28,
                fit: BoxFit.scaleDown,
              ),
            ),
            onChanged: (String qiery) {
              QuranService.suraSearch(qiery);
              setState(() {});
            },
          ),
        ),
        Mostrecentiy(),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
          child: Text('Sura List', style: textTheme.titleMedium),
        ),

        Expanded(
          child: ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 20),
            itemBuilder: (_, index) {
              Sura sura = QuranService.surasSearchResult[index];
              return InkWell(
                onTap: () async {
                  QuranService.addMostRecently(sura);
                  await Navigator.of(
                    context,
                  ).pushNamed(AppRoute.suraDetails, arguments: sura);
                  setState(() {});
                },
                child: SuraItem(sura),
              );
            },
            itemCount: QuranService.surasSearchResult.length,
            separatorBuilder: (_, index) => Divider(
              thickness: 1,
              color: AppColor.whiteColor,
              indent: mediaQueryWidth * 0.1,
              endIndent: mediaQueryWidth * 0.1,
            ),
          ),
        ),
      ],
    );
  }
}
