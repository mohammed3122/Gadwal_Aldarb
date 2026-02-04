import 'package:flutter/material.dart';
import 'package:gadwal_aldarb_res/views/home_view.dart';

void main() {
  runApp(const GadwalAldarb());
}

class GadwalAldarb extends StatelessWidget {
  const GadwalAldarb({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: HomeView());
  }
}
