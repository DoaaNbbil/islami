import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:islam/tabs/hadeth/hadeth_item.dart';

class HadethTabs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 12, bottom: 20),
      child: CarouselSlider.builder(
        itemCount: 50,
        itemBuilder: (_, int Index, __) => HadethItem(index: Index),
        options: CarouselOptions(
          height: double.infinity,
          enlargeCenterPage: true,
          enlargeFactor: 0.2,
        ),
      ),
    );
  }
}
