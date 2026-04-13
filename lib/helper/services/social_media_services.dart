import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> launchWhatsApp({
  required String phone,
  required String errorMessage,
  required BuildContext context,
}) async {
  final uri = Uri.parse("whatsapp://send?phone=$phone");
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  } else {
    // fallback لـ wa.me (لو whatsapp:// مش مدعوم)
    final webUri = Uri.parse("https://wa.me/$phone");
    if (await canLaunchUrl(webUri)) {
      await launchUrl(webUri, mode: LaunchMode.externalApplication);
    } else {
      // ignore: use_build_context_synchronously
      showDialog(
        // ignore: use_build_context_synchronously
        context: context,
        barrierDismissible: true,
        builder: (context) => Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              bottom: 80,
              left: 24,
              right: 24,
              child: Material(
                color: Colors.transparent,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFF339cd2), Color(0xFF2fc57f)],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.circular(18),
                    boxShadow: [
                      BoxShadow(
                        // ignore: deprecated_member_use
                        color: Colors.teal.withOpacity(0.18),
                        blurRadius: 16,
                        offset: Offset(0, 8),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        errorMessage,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'ElMessiri',
                          fontSize: 16,
                        ),
                      ),
                      Icon(
                        Icons.error_outline,
                        color: Colors.redAccent,
                        size: 28,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
      Future.delayed(Duration(seconds: 2), () {
        // ignore: use_build_context_synchronously
        if (Navigator.of(context).canPop()) {
          // ignore: use_build_context_synchronously
          Navigator.of(context).pop();
        }
      });
    }
  }
}

Future<void> launchLinkedInAndFaceBookAndTelegramAndOther({
  required String url,
  required String errorMessage,
  required BuildContext context,
}) async {
  final uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  } else {
    // fallback لـ wa.me (لو whatsapp:// مش مدعوم)
    final webUri = Uri.parse(url);
    if (await canLaunchUrl(webUri)) {
      await launchUrl(webUri, mode: LaunchMode.externalApplication);
    } else {
      // ignore: use_build_context_synchronously
      showDialog(
        // ignore: use_build_context_synchronously
        context: context,
        barrierDismissible: true,
        builder: (context) => Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              bottom: 80,
              left: 24,
              right: 24,
              child: Material(
                color: Colors.transparent,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFF339cd2), Color(0xFF2fc57f)],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.circular(18),
                    boxShadow: [
                      BoxShadow(
                        // ignore: deprecated_member_use
                        color: Colors.teal.withOpacity(0.18),
                        blurRadius: 16,
                        offset: Offset(0, 8),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        errorMessage,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'ElMessiri',
                          fontSize: 16,
                        ),
                      ),
                      Icon(
                        Icons.error_outline,
                        color: Colors.redAccent,
                        size: 28,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
      Future.delayed(Duration(seconds: 2), () {
        // ignore: use_build_context_synchronously
        if (Navigator.of(context).canPop()) {
          // ignore: use_build_context_synchronously
          Navigator.of(context).pop();
        }
      });
    }
  }
}
