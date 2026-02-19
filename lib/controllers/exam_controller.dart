import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gadwal_aldarb_res/helper/functions/arabic_digits.dart';

class TypingExamLogic {
  TypingExamLogic({required this.number}) {
    _generateQuestion();
  }

  static const int totalQuestions = 10;
  static const int _minMultiplier = 1;
  static const int _maxMultiplier = 12;

  final int number;
  final Random _random = Random();

  int currentQuestion = 1;
  int score = 0;
  int multiplier = 1;
  List<int> options = [];
  int? selectedOption;
  bool isFinished = false;
  String? feedbackMessage;
  Color? feedbackColor;

  int get correctAnswer => number * multiplier;

  AnswerSubmissionResult submitAnswer(int chosen) {
    if (feedbackMessage != null) {
      return const AnswerSubmissionResult.ignored();
    }

    selectedOption = chosen;
    final bool isCorrect = chosen == correctAnswer;

    if (isCorrect) {
      score++;
      feedbackMessage = 'إجابة صحيحة🎉';
      feedbackColor = Colors.green;
    } else {
      feedbackMessage =
          'إجابة خاطئة ، الصحيح : ${formatArabicNumber(correctAnswer)}';
      feedbackColor = Colors.red;
    }

    if (currentQuestion >= totalQuestions) {
      isFinished = true;
    }

    return AnswerSubmissionResult(
      isIgnored: false,
      isCorrect: isCorrect,
      isFinished: isFinished,
      correctAnswer: correctAnswer,
    );
  }

  bool nextQuestion() {
    if (currentQuestion >= totalQuestions) {
      return false;
    }
    currentQuestion++;
    _generateQuestion();
    return true;
  }

  void restartTest() {
    currentQuestion = 1;
    score = 0;
    isFinished = false;
    _generateQuestion();
  }

  void _generateQuestion() {
    multiplier =
        _minMultiplier + _random.nextInt(_maxMultiplier - _minMultiplier + 1);
    feedbackMessage = null;
    feedbackColor = null;
    selectedOption = null;
    options = _generateOptions();
  }

  List<int> _generateOptions() {
    final Set<int> generatedOptions = {correctAnswer};
    while (generatedOptions.length < 4) {
      final int delta = _random.nextInt(7) - 3;
      int candidate = correctAnswer + delta;
      if (candidate <= 0) {
        candidate = correctAnswer + _random.nextInt(5) + 1;
      }
      generatedOptions.add(candidate);
    }
    return generatedOptions.toList()..shuffle(_random);
  }
}

class AnswerSubmissionResult {
  const AnswerSubmissionResult({
    required this.isIgnored,
    required this.isCorrect,
    required this.isFinished,
    required this.correctAnswer,
  });

  const AnswerSubmissionResult.ignored()
    : isIgnored = true,
      isCorrect = false,
      isFinished = false,
      correctAnswer = 0;

  final bool isIgnored;
  final bool isCorrect;
  final bool isFinished;
  final int correctAnswer;
}
