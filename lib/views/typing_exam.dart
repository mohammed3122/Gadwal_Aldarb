import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:gadwal_aldarb_res/consts.dart';
import 'package:gadwal_aldarb_res/helper/functions/arabic_digits.dart';
import 'package:gadwal_aldarb_res/helper/functions/convert_numberTotext_question.dart';
import 'package:gadwal_aldarb_res/helper/functions/get_card_darb_color.dart';
import 'package:gadwal_aldarb_res/helper/functions/mobile&tablet_appBar_shape.dart';
import 'package:gadwal_aldarb_res/helper/functions/responsive_font_size.dart';
import 'package:gadwal_aldarb_res/helper/services/tts_service.dart';
import 'package:gadwal_aldarb_res/views/typing_exam_logic.dart';
import 'package:gadwal_aldarb_res/widgets/style_app_bar.dart';

class TypingExam extends StatefulWidget {
  const TypingExam({super.key, required this.number});
  static String id = 'TypingExam';
  final int number;

  @override
  State<TypingExam> createState() => _TypingExamState();
}

class _TypingExamState extends State<TypingExam> {
  late ConfettiController _confettiController;
  late TypingExamLogic logic;

  @override
  void initState() {
    super.initState();
    logic = TypingExamLogic(number: widget.number);
    _confettiController = ConfettiController(
      duration: const Duration(seconds: 1),
    );
  }

  @override
  void dispose() {
    _confettiController.dispose();
    super.dispose();
  }

  void submitAnswer(int chosen) {
    final AnswerSubmissionResult result = logic.submitAnswer(chosen);
    if (result.isIgnored) {
      return;
    }

    setState(() {});

    if (result.isCorrect) {
      _confettiController.play();
      Speaker.instance.speak('ممتاز\n\nاِلِّي بَعْدُهْ');
    } else {
      Speaker.instance.speak('غَلَطْ\n\nركـزْ شُوَيَّهْ\n\n أو روحْ راجعْ');
    }

    if (result.isFinished) {
      return;
    }

    Future.delayed(const Duration(seconds: 3), () {
      if (!mounted) return;
      _nextQuestion();
    });
  }

  void _nextQuestion() {
    setState(() {
      logic.nextQuestion();
    });
  }

  void _restartTest() {
    setState(() {
      logic.restartTest();
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool showResult = logic.isFinished;

    return Scaffold(
      appBar: AppBar(
        flexibleSpace: StyleAppBar(),
        shape: mobileAndTabletShapeAppbar(),
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
        backgroundColor: kMainColor,
        title: Text(
          'اختبار جدول الضرب (${formatArabicNumber(widget.number)})',
          style: TextStyle(
            color: Colors.white,
            fontSize: getResponsiveFontSize(context, baseFontSize: 23),
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 100),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            elevation: 5,
            color: getGadwalColor(widget.number).withValues(alpha: 0.5),
            child: Expanded(
              child: Column(
                children: [
                  ConfettiWidget(
                    confettiController: _confettiController,
                    blastDirection: 3.14 / 2,
                    emissionFrequency: 0,
                    numberOfParticles: 20,
                    gravity: .25,
                    shouldLoop: false,
                  ),
                  Spacer(flex: 1),
                  Text(
                    'السؤال ${toArabicDigits(convertNumberQuestionToText(logic.currentQuestion))} ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: getResponsiveFontSize(
                        context,
                        baseFontSize: 40,
                      ),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Spacer(flex: 4),
                  Text(
                    ' ${formatArabicNumber(logic.multiplier)} × ${formatArabicNumber(widget.number)} = ؟',
                    style: TextStyle(
                      color: const Color.fromARGB(255, 5, 67, 117),
                      fontSize: getResponsiveFontSize(
                        context,
                        baseFontSize: 45,
                      ),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(flex: 1),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Wrap(
                      spacing: 12,
                      runSpacing: 12,
                      alignment: WrapAlignment.center,
                      children: logic.options.map((option) {
                        final bool isCorrect = option == logic.correctAnswer;
                        final bool isSelected = option == logic.selectedOption;
                        Color? background;
                        if (logic.feedbackMessage != null && isSelected) {
                          background = isCorrect ? kMainColor : Colors.red;
                        }
                        return SizedBox(
                          width: 140,
                          child: ElevatedButton(
                            onPressed: logic.feedbackMessage == null
                                ? () => submitAnswer(option)
                                : null,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: background == null
                                  ? Colors.black
                                  : Colors.white,
                              side: BorderSide(color: kMainColor),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 18,
                                vertical: 14,
                              ),
                            ),
                            child: Text(
                              formatArabicNumber(option),
                              style: TextStyle(
                                fontSize: getResponsiveFontSize(
                                  context,
                                  baseFontSize: 35,
                                ),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  Spacer(flex: 6),
                  if (logic.feedbackMessage != null)
                    Container(
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
                            fontSize: getResponsiveFontSize(
                              context,
                              baseFontSize: 25,
                            ),
                          ),
                        ),
                      ),
                    ),
                  Spacer(flex: 7),
                  if (showResult) ...[
                    const SizedBox(height: 24),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'نتيجتك : ${formatArabicNumber(logic.score)} / ${formatArabicNumber(TypingExamLogic.totalQuestions)}',
                          style: TextStyle(
                            fontSize: getResponsiveFontSize(
                              context,
                              baseFontSize: 22,
                            ),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Spacer(flex: 3),
                    const SizedBox(height: 12),
                    GestureDetector(
                      onTap: _restartTest,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [Color(0xFF339cd2), Color(0xFF2fc57f)],
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'إعادة الاختبار',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: getResponsiveFontSize(
                                context,
                                baseFontSize: 25,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Spacer(flex: 7),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
