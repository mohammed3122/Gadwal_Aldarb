import 'package:flutter/material.dart';
import 'package:gadwal_aldarb_res/consts.dart';
import 'package:gadwal_aldarb_res/helper/functions/responsive_font_size.dart';

class Item extends StatelessWidget {
  const Item({super.key, required this.number, required this.index});

  final int number;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: kCardColors[index],
      child: Center(
        child: Text(
          number.toString(),
          style: TextStyle(
            color: Colors.white,
            fontSize: getResponsiveFontSize(context, baseFontSize: 100),
          ),
        ),
      ),
    );
  }
}
