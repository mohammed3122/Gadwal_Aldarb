import 'package:flutter/material.dart';

class NoGadwalDarbView extends StatelessWidget {
  const NoGadwalDarbView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage('assets/images/noData.png'),
          ),
        ),
        width: 350,
        height: 350,
      ),
    );
  }
}
