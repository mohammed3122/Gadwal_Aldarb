import 'package:flutter/material.dart';
import 'package:gadwal_aldarb_res/controllers/exam_controller.dart';
import 'package:gadwal_aldarb_res/helper/functions/responsive_font_size.dart';

class FeedBackWidget extends StatelessWidget {
  const FeedBackWidget({super.key, required this.logic});

  final TypingExamLogic logic;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          logic.feedbackMessage!,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: logic.feedbackColor,
            fontWeight: FontWeight.bold,
            fontSize: getResponsiveFontSize(context, baseFontSize: 25),
          ),
        ),
      ),
    );
  }
}
