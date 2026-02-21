import 'package:flutter/material.dart';
import 'package:gadwal_aldarb/helper/functions/navigator_to_gadwal.dart';
import 'package:gadwal_aldarb/helper/services/user_services.dart';
import 'package:gadwal_aldarb/models/select_enum_gender.dart';
import 'package:gadwal_aldarb/widgets/image_welcome.dart';
import 'package:gadwal_aldarb/widgets/item_widget.dart';

class MobileLayout extends StatefulWidget {
  const MobileLayout({super.key});

  @override
  State<MobileLayout> createState() => _MobileLayoutState();
}

class _MobileLayoutState extends State<MobileLayout>
    with TickerProviderStateMixin {
  final AssetImage _welcomeImage =
      UserService.getCurrentUser()!.gender == Gender.male
      ? AssetImage('assets/images/boy_welcome.png')
      : AssetImage('assets/images/girl_welcome.png');
  late final AnimationController _welcomeController;
  late final Animation<double> _fadeAnimation;
  late final Animation<Offset> _slideAnimation;
  late final Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _welcomeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1100),
    );
    _fadeAnimation = CurvedAnimation(
      parent: _welcomeController,
      curve: Curves.easeInOutSine,
    );
    _slideAnimation =
        Tween<Offset>(begin: const Offset(-0.32, 0), end: Offset.zero).animate(
          CurvedAnimation(
            parent: _welcomeController,
            curve: Curves.easeOutCubic,
          ),
        );
    _scaleAnimation = Tween<double>(begin: 0.97, end: 1).animate(
      CurvedAnimation(parent: _welcomeController, curve: Curves.easeOutSine),
    );

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (!mounted) return;
      await precacheImage(_welcomeImage, context);
      await Future<void>.delayed(const Duration(milliseconds: 120));
      if (!mounted) return;
      _welcomeController.forward();
    });
  }

  @override
  void dispose() {
    _welcomeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView.builder(
          itemCount: 12,
          itemBuilder: (context, index) {
            int number = index + 1;
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Item(
                number: number,
                index: index,
                onTap: () => navigatorToGadwalView(context, number: number),
              ),
            );
          },
        ),
        ImageWelcome(
          fadeAnimation: _fadeAnimation,
          slideAnimation: _slideAnimation,
          scaleAnimation: _scaleAnimation,
          welcomeImage: _welcomeImage,
        ),
      ],
    );
  }
}
