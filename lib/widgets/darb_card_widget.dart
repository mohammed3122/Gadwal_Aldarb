import 'package:flutter/material.dart';
import 'package:gadwal_aldarb_res/consts.dart';
import 'package:gadwal_aldarb_res/helper/functions/responsive_font_size.dart';

class DarbCard extends StatelessWidget {
  const DarbCard({super.key, required this.number, required this.index});
  final int number, index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 12),

      child: Card(
        color: kMainColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          child: Row(
            children: [
              Flexible(
                child: FittedBox(
                  child: Text(
                    '$index × $number = ${index * number}',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: getResponsiveFontSize(
                        context,
                        baseFontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
