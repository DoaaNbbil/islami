import 'package:flutter/material.dart';
import 'package:islam/uitls/color.dart';

class Containerwidget extends StatelessWidget {
  Containerwidget({
    super.key,
    required this.child,
    this.color = AppColor.primaryColor,
  });
  Color color;
  var child;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          height: 40,
          margin: EdgeInsets.only(top: 25),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(20),
          ),
          child: child,
        ),
      ),
    );
  }
}
