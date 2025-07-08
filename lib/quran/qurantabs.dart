import 'package:flutter/material.dart';
import 'package:islam/quran/sura.dart';
import 'package:islam/quran/sura_item.dart';
import 'package:islam/quran/sura_service.dart';
import 'package:islam/uitls/color.dart';
import 'package:islam/uitls/routeNames.dart';

class QuranTabs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double mediaQueryWidth = MediaQuery.sizeOf(context).width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Text(
            'Sura List',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        Expanded(
          child: ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 20),
            itemBuilder: (_, index) {
              Sura sura = QuranService.suras[index];
              return InkWell(
                onTap: () {
                  Navigator.of(
                    context,
                  ).pushNamed(AppRoute.suraDetails, arguments: sura);
                },
                child: SuraItem(sura),
              );
            },
            itemCount: QuranService.suras.length,
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
