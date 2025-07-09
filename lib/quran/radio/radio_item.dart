import 'package:flutter/material.dart';
import 'package:islam/uitls/color.dart';

class RadioItem extends StatelessWidget {
  RadioItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 97,
      decoration: BoxDecoration(
        color: AppColor.primaryColor,
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: AssetImage('assets/images/bottom_details_sura.png'),
        ),
      ),
      child: Column(
        children: [
          Text(
            'Ibrahim Al-Akdar',
            style: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(color: AppColor.blackColor),
          ),
        ],
      ),
    );
  }
}
