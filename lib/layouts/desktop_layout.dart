import 'package:flutter/material.dart';
import 'package:gadwal_aldarb_res/layouts/tablet_layout.dart';
import 'package:gadwal_aldarb_res/views/drawer_view.dart';
import 'package:gadwal_aldarb_res/views/gadwal_aldarb_view.dart';

class DesktopLayout extends StatefulWidget {
  const DesktopLayout({super.key});
  @override
  State<DesktopLayout> createState() => _DesktopLayoutState();
}

class _DesktopLayoutState extends State<DesktopLayout> {
  dynamic number = 'no yet';
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(flex: 2, child: DrawerView(isDesktop: true)),
        Expanded(
          flex: 3,
          child: TabletLayout(
            showGadwal: (int index) {
              setState(() {
                number = index;
              });
            },
          ),
        ),
        Expanded(flex: 2, child: GadwalAldarbView(number: number)),
      ],
    );
  }
}
