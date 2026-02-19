import 'package:flutter/material.dart';
import 'package:gadwal_aldarb_res/consts.dart';
import 'package:gadwal_aldarb_res/helper/functions/arabic_digits.dart';
import 'package:gadwal_aldarb_res/helper/functions/get_card_darb_color.dart';
import 'package:gadwal_aldarb_res/helper/functions/responsive_font_size.dart';
import 'package:gadwal_aldarb_res/helper/services/tts_service.dart';

class DarbCard extends StatelessWidget {
  const DarbCard({super.key, required this.number, required this.index});
  final int number, index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 60),
      child: Card(
        elevation: 5,
        color: getGadwalColor(number),
        child: InkWell(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          highlightColor: kMainColor(),
          onTap: () async {
            await Speaker.instance.speak(
              '$index في $number = ${index * number}',
            );
          },
          child: Center(
            child: FittedBox(
              child: Text(
                toArabicDigits('$index × $number = ${index * number}'),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: getResponsiveFontSize(context, baseFontSize: 30),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
