import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:islam/uitls/color.dart';

class NavBarSelected extends StatelessWidget {
  NavBarSelected({required this.nameImage});
  String nameImage;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 6, horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(66),
        color: AppColor.blackColor.withValues(alpha: 0.6),
      ),
      child: SvgPicture.asset(
        'assets/icons/$nameImage.svg',
        height: 22,
        width: 22,
        fit: BoxFit.fill,
        colorFilter: ColorFilter.mode(AppColor.whiteColor, BlendMode.srcIn),
      ),
    );
  }
}
