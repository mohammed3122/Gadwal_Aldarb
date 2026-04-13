import 'package:flutter/material.dart';
import 'package:gadwal_aldarb/consts.dart';
import 'package:gadwal_aldarb/helper/functions/responsive_font_size.dart';
import 'package:gadwal_aldarb/widgets/avatar_dev.dart';
import 'package:gadwal_aldarb/widgets/message_body.dart';

class OurMessageBtn extends StatelessWidget {
  const OurMessageBtn({super.key, required this.isDesktop});

  final bool isDesktop;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 70),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 5,
          backgroundColor: isDesktop ? kMainColor() : Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        onPressed: () {
          _showAboutDialog(context, isDesktop);
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          child: Center(
            child: Text(
              'رِسالـتـنا 💚',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xff00c064),
                // isDesktop ? Colors.white : Colors.black,
                fontSize: getResponsiveFontSize(context, baseFontSize: 20),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

void _showAboutDialog(BuildContext context, bool isDesktop) {
  const Color start = Color(0xFF339cd2);
  const Color end = Color(0xFF2fc57f);

  showDialog(
    context: context,
    builder: (context) => Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      clipBehavior: Clip.antiAlias,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          // Header Gradient
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [start, end],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
            child: Column(
              children: [
                AvatarDeveloper(),
                const SizedBox(height: 10),
                const Text(
                  'محمد عبداللطيف عوض',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'مطوّر تطبيقات Flutter',
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.white.withAlpha(217), // 0.85 * 255
                  ),
                ),
              ],
            ),
          ),

          // Body
          MessageBody(start: start, end: end),
        ],
      ),
    ),
  );
}
