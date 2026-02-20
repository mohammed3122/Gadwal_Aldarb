import 'package:flutter/material.dart';
import 'package:gadwal_aldarb/controllers/exam_controller.dart';
import 'package:gadwal_aldarb/helper/functions/arabic_digits.dart';
import 'package:gadwal_aldarb/helper/functions/responsive_font_size.dart';

class FinalRseult extends StatelessWidget {
  const FinalRseult({super.key, required this.logic});

  final TypingExamLogic logic;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          'نتيجتك : ${formatArabicNumber(logic.score)} / ${formatArabicNumber(TypingExamLogic.totalQuestions)}',
          style: TextStyle(
            fontSize: getResponsiveFontSize(context, baseFontSize: 22),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
