import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:islam/uitls/color.dart';

class OnboardingPage extends StatelessWidget {
  final String image;
  final String title;
  final String description;

  const OnboardingPage({
    required this.image,
    required this.title,
    required this.description,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            image,
            height: MediaQuery.sizeOf(context).height * 0.4,
            width: double.infinity,
          ),
          const SizedBox(height: 10),
          Text(
            title,
            style: textTheme.headlineSmall!.copyWith(
              color: AppColor.primaryColor,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),
          if (description.isNotEmpty)
            Text(
              description,
              style: textTheme.titleMedium!.copyWith(
                color: AppColor.primaryColor,
              ),
              textAlign: TextAlign.center,
            ),
        ],
      ),
    );
  }
}
