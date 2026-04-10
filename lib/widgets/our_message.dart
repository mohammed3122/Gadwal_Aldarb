import 'package:flutter/material.dart';
import 'package:gadwal_aldarb/consts.dart';
import 'package:gadwal_aldarb/helper/functions/responsive_font_size.dart';

class OurMessageBtn extends StatelessWidget {
  const OurMessageBtn({super.key, required this.isDesktop});

  final bool isDesktop;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 70),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 5,
          backgroundColor: isDesktop ? kMainColor() : Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        onPressed: () {},
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          child: Center(
            child: Text(
              'رسالـتـنا',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: isDesktop ? Colors.white : Colors.black,
                fontSize: getResponsiveFontSize(context, baseFontSize: 20),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
