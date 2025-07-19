import 'package:flutter/material.dart';
import 'package:islam/quran/mostRecentlyItems.dart';
import 'package:islam/quran/sura.dart';
import 'package:islam/quran/sura_service.dart';

class Mostrecentiy extends StatelessWidget {
  Mostrecentiy({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Visibility(
      visible: QuranService.mostRecentlySuras.isNotEmpty,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
            child: Text('Moset Recently', style: textTheme.titleMedium),
          ),
          SizedBox(height: 10),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.16,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) => MostRecentlyItems(
                QuranService.mostRecentlySuras.reversed.toList()[index],
              ),
              separatorBuilder: (_, __) => SizedBox(width: 15),
              itemCount: QuranService.mostRecentlySuras.length,
            ),
          ),
        ],
      ),
    );
  }
}
