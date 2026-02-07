import 'package:flutter/material.dart';
import 'package:gadwal_aldarb_res/consts.dart';
import 'package:gadwal_aldarb_res/helper/functions/responsive_font_size.dart';

class Item extends StatelessWidget {
  const Item({
    super.key,
    required this.number,
    required this.index,
    required this.onTap,
  });

  final int number;
  final int index;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    // ModalRoute Color colorDrb=
    return InkWell(
      onTap: onTap,
      child: Card(
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
      ),
    );
  }
}
