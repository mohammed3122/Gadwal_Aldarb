import 'package:flutter/material.dart';
import 'package:gadwal_aldarb/consts.dart';
import 'package:gadwal_aldarb/helper/functions/responsive_font_size.dart';

class CusotmContainer extends StatelessWidget {
  const CusotmContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [BoxShadow(color: Colors.white, blurRadius: 9)],
        borderRadius: BorderRadius.circular(30),
        color: kMainColor(),
        // gradient: LinearGradient(
        //   begin: Alignment.centerLeft,
        //   end: Alignment.centerRight,
        //   colors: [Color(0xFF339cd2), Color(0xFF2fc57f)],
        // ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          'إعادة الاختبار',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: getResponsiveFontSize(context, baseFontSize: 25),
          ),
        ),
      ),
    );
  }
}
