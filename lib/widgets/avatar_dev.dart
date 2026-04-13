import 'package:flutter/material.dart';

class AvatarDeveloper extends StatelessWidget {
  const AvatarDeveloper({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 145,
      height: 145,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        shape: BoxShape.rectangle,
        color: Colors.white,
        border: Border.all(color: Colors.white, width: 1.2),
        boxShadow: [
          BoxShadow(
            color: Colors.white,
            blurRadius: 14,
            offset: const Offset(0, 4),
          ),
        ],
        image: DecorationImage(
          image: AssetImage('assets/images/developer/me_with_lab.png'),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
