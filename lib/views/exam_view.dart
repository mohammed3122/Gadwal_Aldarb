import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:gadwal_aldarb/consts.dart';
import 'package:gadwal_aldarb/controllers/exam_controller.dart';
import 'package:gadwal_aldarb/helper/functions/arabic_digits.dart';
import 'package:gadwal_aldarb/helper/functions/convert_numberTotext_question.dart';
import 'package:gadwal_aldarb/helper/functions/get_card_darb_color.dart';
import 'package:gadwal_aldarb/helper/functions/mobile&tablet_appBar_shape.dart';
import 'package:gadwal_aldarb/helper/functions/responsive_font_size.dart';
import 'package:gadwal_aldarb/helper/services/tts_service.dart';
import 'package:gadwal_aldarb/models/select_enum_gender.dart';
import 'package:gadwal_aldarb/widgets/Container_For_final_Rsult.dart';
import 'package:gadwal_aldarb/widgets/custom_Container_For_Button.dart';
import 'package:gadwal_aldarb/widgets/feedBack_widget.dart';

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

      if (savedUser!.gender == Gender.male) {
        Speaker.instance.speak('ممتاز');
      } else {
        Speaker.instance.speak('ممتازَهْ');
      }
    } else {
      Speaker.instance.speak('غَلَطْ\n\nركـزْ شُوَيَّهْ\n\n أو روحْ راجعْ');

      if (savedUser!.gender == Gender.male) {
        Speaker.instance.speak('غَلَطْ\n\nركـزْ شُوَيَّهْ\n\n أو روحْ راجعْ');
      } else {
        Speaker.instance.speak('غَلَطْ\n\nركـزي شُوَيَّهْ\n\n أو روحي راجعي');
      }
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
        shape: mobileAndTabletShapeAppbar(),
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
        backgroundColor: kMainColor(),
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
                    fontSize: getResponsiveFontSize(context, baseFontSize: 40),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Spacer(flex: 4),
                Text(
                  ' ${formatArabicNumber(logic.multiplier)} × ${formatArabicNumber(widget.number)} = ؟',
                  style: TextStyle(
                    color: const Color.fromARGB(255, 5, 67, 117),
                    fontSize: getResponsiveFontSize(context, baseFontSize: 45),
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
                        background = isCorrect ? kMainColor() : Colors.red;
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
                            side: BorderSide(color: kMainColor()),
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
                Spacer(flex: 7),
                if (logic.feedbackMessage != null) FeedBackWidget(logic: logic),
                Spacer(flex: 7),
                if (showResult) ...[
                  Spacer(flex: 7),
                  FinalRseult(logic: logic),
                  Spacer(flex: 3),
                  const SizedBox(height: 12),
                  GestureDetector(
                    onTap: _restartTest,
                    child: CusotmContainer(),
                  ),
                  Spacer(flex: 7),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
