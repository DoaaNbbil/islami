import 'package:flutter/material.dart';
import 'package:islam/tabs/hadeth/hadeth.dart';
import 'package:islam/uitls/color.dart';
import 'package:islam/widget/loadingindicator.dart';

class hadethdetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double heigthScreen = MediaQuery.sizeOf(context).height;
    TextTheme textTheme = Theme.of(context).textTheme;
    Hadeth hadeth = ModalRoute.of(context)!.settings.arguments as Hadeth;

    return Scaffold(
      appBar: AppBar(title: Text('Hadeth ${hadeth.num}')),
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
                Expanded(
                  child: Text(
                    hadeth.title,
                    style: textTheme.headlineSmall?.copyWith(
                      color: AppColor.primaryColor,
                    ),
                    textAlign: TextAlign.center,
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
            child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 20),
              itemBuilder: (_, index) {
                return Text(
                  hadeth.content[index],
                  style: textTheme.titleLarge?.copyWith(
                    color: AppColor.primaryColor,
                  ),
                  textAlign: TextAlign.center,
                );
              },
              itemCount: hadeth.content.length,
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
}
