import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islam/uitls/color.dart';

class RadioItem extends StatelessWidget {
  RadioItem({
    this.imageName = 'assets/images/Polygon 2.svg',
    this.iconName = 'assets/icons/Volume High.svg',
    required this.namesRadio,
  });

  final String imageName;
  final String iconName;
  final String namesRadio;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 120,
      decoration: BoxDecoration(
        color: AppColor.primaryColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: -10,
            right: 0,
            left: 0,
            child: ColorFiltered(
              colorFilter: ColorFilter.mode(
                Colors.black.withValues(alpha: 0.2),
                BlendMode.srcIn,
              ),
              child: Image.asset(
                'assets/images/Mosque-02.png',
                fit: BoxFit.contain,
                height: 100,
              ),
            ),
          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                namesRadio,
                style: Theme.of(
                  context,
                ).textTheme.titleLarge?.copyWith(color: AppColor.blackColor),
              ),
              SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Spacer(flex: 3),
                  SvgPicture.asset(imageName),
                  SizedBox(width: 25),
                  SvgPicture.asset(iconName),
                  Spacer(flex: 2),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
