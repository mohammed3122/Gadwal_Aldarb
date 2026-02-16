String convertNumberQuestionToText(int currentQuestion) {
  switch (currentQuestion) {
    case 1:
      return 'الأول';
    case 2:
      return 'الثاني';
    case 3:
      return 'الثالث';
    case 4:
      return 'الرابع';
    case 5:
      return 'الخامس';
    case 6:
      return 'السادس';
    case 7:
      return 'السابع';
    case 8:
      return 'الثامن';
    case 9:
      return 'التاسع';
    case 10:
      return 'العاشر';

    default:
      return currentQuestion.toString();
  }
}
