import 'package:flutter/material.dart';
import 'package:islam/uitls/color.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingNavigation extends StatelessWidget {
  final bool onLastPage;
  final PageController controller;
  final VoidCallback finishOnboarding;

  const OnboardingNavigation({
    required this.onLastPage,
    required this.controller,
    required this.finishOnboarding,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        (controller.hasClients && (controller.page ?? 0) > 0)
            ? GestureDetector(
                onTap: () {
                  if ((controller.page ?? 0) > 0) {
                    controller.previousPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    );
                  }
                },
                child: Text(
                  'Back',
                  style: textTheme.titleMedium!.copyWith(
                    color: AppColor.primaryColor,
                  ),
                ),
              )
            : const SizedBox(width: 60),
        SmoothPageIndicator(
          controller: controller,
          count: 5,
          effect: ExpandingDotsEffect(
            activeDotColor: AppColor.primaryColor,
            dotColor: Colors.grey.shade300,
            dotHeight: 10,
            dotWidth: 10,
            expansionFactor: 3,
          ),
        ),
        GestureDetector(
          onTap: () {
            if ((controller.page ?? 0) < 4) {
              controller.nextPage(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
              );
            } else {
              finishOnboarding();
            }
          },
          child: Text(
            'Next',
            style: textTheme.titleMedium!.copyWith(
              color: AppColor.primaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
