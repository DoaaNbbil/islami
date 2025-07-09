import 'package:flutter/material.dart';
import 'package:islam/quran/radio/radio_item.dart';

class RadioTabs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(children: [

      ],),
        Expanded(
          child: ListView.separated(
            itemBuilder: (_, index) => RadioItem(),
            separatorBuilder: (_, __) => SizedBox(height: 12),

            itemCount: 10,
          ),
        ),
      ],
    );
  }
}
