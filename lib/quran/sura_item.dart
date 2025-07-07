import 'package:flutter/material.dart';
import 'package:islam/quran/sura.dart';

class SuraItem extends StatelessWidget {
  Sura sura;
  SuraItem(this.sura);
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Row(
      children: [
        Container(
          margin: EdgeInsets.only(right: 20),
          height: 52,
          width: 52,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/sura_number_frame.png'),
            ),
          ),
          child: Text('${sura.num}', style: textTheme.titleLarge),
        ),
        Column(
          children: [
            Text('${sura.englishNames}', style: textTheme.titleLarge),
            Text('${sura.ayaNumber} Verses', style: textTheme.titleSmall),
          ],
        ),
        Spacer(),
        Text('${sura.arabicNames}', style: textTheme.titleLarge),
      ],
    );
  }
}
