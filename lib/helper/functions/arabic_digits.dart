String toArabicDigits(String input) {
  const arabicDigits = '٠١٢٣٤٥٦٧٨٩';
  return input.replaceAllMapped(RegExp(r'\d'), (match) {
    final digit = int.parse(match[0]!);
    return arabicDigits[digit];
  });
}

String formatArabicNumber(num value) {
  return toArabicDigits(value.toString());
}
