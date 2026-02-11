import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gadwal_aldarb_res/consts.dart';
import 'package:gadwal_aldarb_res/helper/functions/arabic_digits.dart';
import 'package:gadwal_aldarb_res/helper/functions/responsive_font_size.dart';

class GadwalTestView extends StatefulWidget {
  const GadwalTestView({super.key, required this.number});

  final int number;

  @override
  State<GadwalTestView> createState() => _GadwalTestViewState();
}

class _GadwalTestViewState extends State<GadwalTestView> {
  static const int _totalQuestions = 10;
  static const int _minMultiplier = 1;
  static const int _maxMultiplier = 12;

  final Random _random = Random();

  int _currentQuestion = 1;
  int _score = 0;
  int _multiplier = 1;
  List<int> _options = [];
  int? _selectedOption;
  bool _isFinished = false;
  String? _feedbackMessage;
  Color? _feedbackColor;

  @override
  void initState() {
    super.initState();
    _generateQuestion();
  }

  void _generateQuestion() {
    _multiplier =
        _minMultiplier + _random.nextInt(_maxMultiplier - _minMultiplier + 1);
    _feedbackMessage = null;
    _feedbackColor = null;
    _selectedOption = null;
    _options = _generateOptions();
  }

  List<int> _generateOptions() {
    final int correctAnswer = widget.number * _multiplier;
    final Set<int> options = {correctAnswer};
    while (options.length < 4) {
      final int delta = _random.nextInt(7) - 3; // -3..3
      int candidate = correctAnswer + delta;
      if (candidate <= 0) {
        candidate = correctAnswer + _random.nextInt(5) + 1;
      }
      options.add(candidate);
    }
    final List<int> result = options.toList()..shuffle(_random);
    return result;
  }

  void _submitAnswer(int chosen) {
    if (_feedbackMessage != null) {
      return;
    }
    _selectedOption = chosen;
    final int correctAnswer = widget.number * _multiplier;
    final bool isCorrect = chosen == correctAnswer;

    setState(() {
      if (isCorrect) {
        _score++;
        _feedbackMessage = 'إجابة صحيحة';
        _feedbackColor = kMainColor;
      } else {
        _feedbackMessage =
            'إجابة خاطئة، الصحيح: ${formatArabicNumber(correctAnswer)}';
        _feedbackColor = Colors.red;
      }
    });

    if (_currentQuestion >= _totalQuestions) {
      setState(() {
        _isFinished = true;
      });
      return;
    }

    Future.delayed(const Duration(milliseconds: 600), () {
      if (!mounted) return;
      _nextQuestion();
    });
  }

  void _nextQuestion() {
    if (_currentQuestion >= _totalQuestions) {
      return;
    }
    setState(() {
      _currentQuestion++;
      _generateQuestion();
    });
  }

  void _restartTest() {
    setState(() {
      _currentQuestion = 1;
      _score = 0;
      _isFinished = false;
      _generateQuestion();
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool showResult = _isFinished;

    return Scaffold(
      appBar: AppBar(
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
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'سؤال ${formatArabicNumber(_currentQuestion)} من ${formatArabicNumber(_totalQuestions)}',
                style: TextStyle(
                  fontSize: getResponsiveFontSize(context, baseFontSize: 18),
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                '${formatArabicNumber(widget.number)} × ${formatArabicNumber(_multiplier)} = ؟',
                style: TextStyle(
                  fontSize: getResponsiveFontSize(context, baseFontSize: 32),
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 24),
              Wrap(
                spacing: 12,
                runSpacing: 12,
                alignment: WrapAlignment.center,
                children: _options.map((option) {
                  final bool isCorrect = option == widget.number * _multiplier;
                  final bool isSelected = option == _selectedOption;
                  Color? background;
                  if (_feedbackMessage != null && isSelected) {
                    background = isCorrect ? kMainColor : Colors.red;
                  }
                  return SizedBox(
                    width: 140,
                    child: ElevatedButton(
                      onPressed: _feedbackMessage == null
                          ? () => _submitAnswer(option)
                          : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: background ?? Colors.white,
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
                            baseFontSize: 20,
                          ),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 16),
              if (_feedbackMessage != null)
                Text(
                  _feedbackMessage!,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: _feedbackColor,
                    fontWeight: FontWeight.bold,
                    fontSize: getResponsiveFontSize(context, baseFontSize: 18),
                  ),
                ),
              if (showResult) ...[
                const SizedBox(height: 24),
                Text(
                  'نتيجتك: ${formatArabicNumber(_score)} / ${formatArabicNumber(_totalQuestions)}',
                  style: TextStyle(
                    fontSize: getResponsiveFontSize(context, baseFontSize: 22),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                ElevatedButton(
                  onPressed: _restartTest,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kMainColor,
                    foregroundColor: Colors.white,
                  ),
                  child: Text(
                    'إعادة الاختبار',
                    style: TextStyle(
                      fontSize: getResponsiveFontSize(
                        context,
                        baseFontSize: 18,
                      ),
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
