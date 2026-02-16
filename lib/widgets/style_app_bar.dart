import 'package:flutter/material.dart';

class StyleAppBar extends StatelessWidget {
  const StyleAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            Color(0xFF339cd2), // الأزرق
            Color(0xFF2fc57f), // الأخضر
          ],
        ),
      ),
    );
  }
}
