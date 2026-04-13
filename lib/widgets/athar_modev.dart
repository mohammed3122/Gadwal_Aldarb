import 'package:flutter/material.dart';
import 'package:gadwal_aldarb/consts.dart';
import 'package:gadwal_aldarb/helper/services/social_media_services.dart';

class AtharModev extends StatelessWidget {
  const AtharModev({super.key, required this.isDesktop});

  final bool isDesktop;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 70),
      child: InkWell(
        borderRadius: BorderRadius.circular(25),
        onTap: () {
          launchLinkedInAndFaceBookAndTelegram(
            url: 'https://www.facebook.com/profile.php?id=61572170937759',
            errorMessage: 'عذرا .. لا يمكن فتح تطبيق الفيسبوك ',
            context: context,
          );
        },
        child: Container(
          height: 70,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: isDesktop
                ? kMainColor().withValues(alpha: 0.5)
                : Colors.white.withValues(alpha: 0.65),
            image: DecorationImage(
              image: AssetImage('assets/images/athar_modev_small.png'),
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
