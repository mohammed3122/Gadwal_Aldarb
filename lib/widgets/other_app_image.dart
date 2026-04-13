import 'package:flutter/material.dart';

class ImageOtherApp extends StatelessWidget {
  const ImageOtherApp({
    super.key,
    required this.isWerd,
    required this.imagePath,
    required this.onTap,
  });
  final bool isWerd;
  final String imagePath;

  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        borderRadius: BorderRadius.circular(25),
        splashColor: Color(0xFF339cd2),
        onTap: onTap,
        child: Container(
          height: isWerd ? 57 : 65,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
