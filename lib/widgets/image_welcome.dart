import 'package:flutter/material.dart';

class ImageWelcome extends StatelessWidget {
  const ImageWelcome({
    super.key,
    required Animation<double> fadeAnimation,
    required Animation<Offset> slideAnimation,
    required Animation<double> scaleAnimation,
    required AssetImage welcomeImage,
  }) : _fadeAnimation = fadeAnimation,
       _slideAnimation = slideAnimation,
       _scaleAnimation = scaleAnimation,
       _welcomeImage = welcomeImage;

  final Animation<double> _fadeAnimation;
  final Animation<Offset> _slideAnimation;
  final Animation<double> _scaleAnimation;
  final AssetImage _welcomeImage;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: -60,
      bottom: 200,
      child: IgnorePointer(
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: SlideTransition(
            position: _slideAnimation,
            child: ScaleTransition(
              scale: _scaleAnimation,
              child: Image(
                image: _welcomeImage,
                fit: BoxFit.contain,
                width: 250,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
