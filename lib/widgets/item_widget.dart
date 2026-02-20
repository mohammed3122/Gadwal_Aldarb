import 'package:flutter/material.dart';
import 'package:gadwal_aldarb/consts.dart';
import 'package:gadwal_aldarb/helper/functions/arabic_digits.dart';
import 'package:gadwal_aldarb/helper/functions/responsive_font_size.dart';

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
    return Card(
      elevation: 5,
      color: kCardColors[index],
      child: InkWell(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        highlightColor: kMainColor(),
        onTap: onTap,
        child: Center(
          child: Text(
            formatArabicNumber(number),
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
