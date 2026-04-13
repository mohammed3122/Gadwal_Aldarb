import 'package:flutter/material.dart';

class QuoteCardFromDeveloper extends StatelessWidget {
  const QuoteCardFromDeveloper({
    super.key,
    required this.end,
    required this.start,
  });

  final Color end;
  final Color start;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
      decoration: BoxDecoration(
        color: end.withAlpha(40),
        borderRadius: BorderRadius.circular(10),
        border: Border(right: BorderSide(color: start, width: 3)),
      ),
      child: Text(
        ' لم نُخلق عبثا ✨\nأخوك - محمد عبداللطيف عوض ',
        style: TextStyle(
          fontSize: 13,
          fontStyle: FontStyle.italic,
          color: start,
          height: 1.6,
        ),
        textAlign: TextAlign.right,
      ),
    );
  }
}
