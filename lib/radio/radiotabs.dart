import 'package:flutter/material.dart';
import 'package:islam/radio/containerWidget.dart';
import 'package:islam/radio/radiITems.dart';
import 'package:islam/uitls/color.dart';

class RadioTabs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 10),
          Row(
            children: [
              Containerwidget(
                child: Text(
                  'Radio',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                color: AppColor.blackColor.withValues(alpha: 0.7),
              ),
              SizedBox(width: 20),
              Containerwidget(
                child: Text(
                  'Reciters',
                  style: Theme.of(
                    context,
                  ).textTheme.titleMedium?.copyWith(color: AppColor.blackColor),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          RadioItem(namesRadio: 'Ibrahim Al-Akdar'),
          SizedBox(height: 20),
          RadioItem(
            namesRadio: 'Akram Alalaqmi',
            iconName: 'assets/icons/Volume Cross.svg',
            imageName: 'assets/images/Pause.svg',
          ),
          SizedBox(height: 20),
          RadioItem(namesRadio: 'Majed Al-Enezi'),
          SizedBox(height: 20),
          RadioItem(namesRadio: 'Malik shaibat Alhamed'),
          SizedBox(height: 20),
          RadioItem(namesRadio: 'Radio Al-Qaria Yassen'),
        ],
      ),
    );
  }
}
