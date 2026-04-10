import 'package:flutter/material.dart';
import 'package:gadwal_aldarb/consts.dart';

class AtharModev extends StatelessWidget {
  const AtharModev({super.key, required this.isDesktop});

  final bool isDesktop;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 70),
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
    );
  }
}
