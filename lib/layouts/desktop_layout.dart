import 'package:flutter/material.dart';
import 'package:gadwal_aldarb_res/layouts/tablet_layout.dart';
import 'package:gadwal_aldarb_res/views/drawer_view.dart';

class DesktopLayout extends StatelessWidget {
  const DesktopLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(flex: 1, child: DrawerView()),
        Expanded(flex: 3, child: TabletLayout()),
      ],
    );
  }
}
