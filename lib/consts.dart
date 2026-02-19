import 'package:flutter/material.dart';

// final Color kMainColor = Color(0xff338b7a);
final List<Color> kCardColors = [
  Color(0xFFEF5350), // 1 - أحمر أهدى
  Color(0xFFFFA726), // 2 - برتقالي أهدى
  Color(0xFFB08968), // 3 - بني دافئ
  Color(0xFF66BB6A), // 4 - أخضر مريح
  Color(0xFF4DD0E1), // 5 - سماوي أهدى
  Color(0xFF42A5F5), // 6 - أزرق أهدى
  Color(0xFFAB47BC), // 7 - بنفسجي أهدى
  Color(0xFFEC407A), // 8 - وردي أهدى
  Color(0xFF8D6E63), // 9 - بني أهدى
  Color.fromARGB(255, 150, 146, 146), // 10 - رمادي متوسط
  Color(0xFF5C6BC0), // 11 - نيلي أهدى
  Color(0xFF9CCC65), // 12 - أخضر ليموني أهدى
  Color(0xFFBDBDBD), // 13 - رمادي متوسط
];

typedef OnTapItem = void Function(int number);
Color kMainColor() {
  const Color start = Color(0xFF339cd2);
  const Color end = Color(0xFF2fc57f);
  return Color.lerp(start, end, 0.5)!;
}
