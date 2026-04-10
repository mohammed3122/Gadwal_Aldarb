import 'package:flutter/material.dart';
import 'package:gadwal_aldarb/helper/services/user_services.dart';
import 'package:gadwal_aldarb/models/select_enum_gender.dart';

class ImageWelcome extends StatefulWidget {
  const ImageWelcome({super.key});

  @override
  State<ImageWelcome> createState() => _ImageWelcomeState();
}

class _ImageWelcomeState extends State<ImageWelcome>
    with TickerProviderStateMixin {
  late final AssetImage _welcomeImage;
  late final AnimationController _welcomeController;
  late final Animation<double> _fadeAnimation;
  late final Animation<Offset> _slideAnimation;
  late final Animation<double> _scaleAnimation;

  @override
  void initState() {
    _welcomeImage = UserService.getCurrentUser()!.gender == Gender.male
        ? AssetImage('assets/images/boy_welcome.png')
        : AssetImage('assets/images/girl_welcome.png');
    // [1] ===========================
    _welcomeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1100),
    );
    // [2]===========================
    _fadeAnimation = CurvedAnimation(
      parent: _welcomeController,
      curve: Curves.decelerate,
    );
    // [3] ===========================
    _slideAnimation =
        Tween<Offset>(begin: const Offset(-0.55, 0), end: Offset.zero).animate(
          CurvedAnimation(
            parent: _welcomeController,
            curve: Curves.easeOutCubic,
          ),
        );
    // [4]===========================
    _scaleAnimation = Tween<double>(begin: 0.97, end: 1.2).animate(
      CurvedAnimation(parent: _welcomeController, curve: Curves.easeOutSine),
    );

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (!mounted) return;
      await precacheImage(_welcomeImage, context);
      await Future<void>.delayed(const Duration(milliseconds: 120));
      if (!mounted) return;
      _welcomeController.forward();
    });
    super.initState();
  }

  @override
  void dispose() {
    _welcomeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: -55,
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
