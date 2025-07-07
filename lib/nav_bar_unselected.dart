import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NavBarUnselected extends StatelessWidget {
  NavBarUnselected({required this.nameImage});
  String nameImage;
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/icons/$nameImage.svg',
      height: 28,
      width: 28,
      fit: BoxFit.fill,
    );
  }
}
