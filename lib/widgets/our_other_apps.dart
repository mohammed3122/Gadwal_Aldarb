import 'package:flutter/material.dart';
import 'package:gadwal_aldarb/consts.dart';
import 'package:gadwal_aldarb/helper/functions/responsive_font_size.dart';
import 'package:gadwal_aldarb/helper/services/social_media_services.dart';
import 'package:gadwal_aldarb/widgets/other_app_image.dart';

class OurOtherApps extends StatelessWidget {
  const OurOtherApps({super.key, required this.isDesktop});

  final bool isDesktop;

  @override
  Widget build(BuildContext context) {
    final Color start = Color(0xFF3ab6ff);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Container(
        height: 110,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: isDesktop
              ? kMainColor().withValues(alpha: 0.5)
              : Colors.white.withValues(alpha: 0.75),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'من تطبيـقاتنـا',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: start,
                fontSize: getResponsiveFontSize(context, baseFontSize: 20),
              ),
            ),
            Row(
              children: [
                ImageOtherApp(
                  isWerd: true,
                  imagePath: 'assets/images/otherApps/al_werd_app.png',
                  onTap: () {
                    launchLinkedInAndFaceBookAndTelegramAndOther(
                      url: 'https://forms.gle/fKemqdpjHLVi8EiQ7',
                      errorMessage: 'عذرا .. لا يمكن فتح تطبيق الورد',
                      context: context,
                    );
                  },
                ),
                // SizedBox(width: 10),
                ImageOtherApp(
                  isWerd: true,
                  imagePath: 'assets/images/otherApps/hasalty_app.png',
                  onTap: () {
                    launchLinkedInAndFaceBookAndTelegramAndOther(
                      url: 'https://forms.gle/XJaLZPx5swwiyAQh6',
                      errorMessage: 'عذرا .. لا يمكن فتح تطبيق حصالتي',
                      context: context,
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
