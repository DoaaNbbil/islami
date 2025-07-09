import 'package:flutter/material.dart';
import 'package:islam/uitls/color.dart';

class Loadingindicator extends StatelessWidget {
  Color? color;
  Loadingindicator({this.color});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(color: color ?? AppColor.primaryColor),
    );
  }
}
