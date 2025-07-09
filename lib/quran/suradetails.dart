import 'package:flutter/material.dart';
import 'package:islam/quran/sura.dart';
import 'package:islam/quran/sura_service.dart';
import 'package:islam/uitls/color.dart';
import 'package:islam/widget/loadingindicator.dart';

class Suradetails extends StatefulWidget {
  @override
  State<Suradetails> createState() => _SuradetailsState();
}

class _SuradetailsState extends State<Suradetails> {
  late Sura sura;

  List<String> ayat = [];

  @override
  Widget build(BuildContext context) {
    double heigthScreen = MediaQuery.sizeOf(context).height;
    TextTheme textTheme = Theme.of(context).textTheme;
    sura = ModalRoute.of(context)!.settings.arguments as Sura;
    if (ayat.isEmpty) {
      loadSura();
    }
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
          Expanded(
            child: ayat.isEmpty
                ? Loadingindicator()
                : ListView.separated(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    itemBuilder: (_, index) {
                      return Text(
                        ayat[index],
                        style: textTheme.titleLarge?.copyWith(
                          color: AppColor.primaryColor,
                        ),
                        textAlign: TextAlign.center,
                      );
                    },
                    itemCount: ayat.length,
                    separatorBuilder: (_, __) => SizedBox(height: 8),
                  ),
          ),
          Image.asset(
            'assets/images/bottom_details_sura.png',
            width: double.infinity,
            fit: BoxFit.fill,
          ),
        ],
      ),
    );
  }

  Future<void> loadSura() async {
    String suraFileContent = await QuranService.loadingSuraFile(sura.num);
    ayat = suraFileContent.split('\r\n');
    print(suraFileContent);
    setState(() {});
  }
}
