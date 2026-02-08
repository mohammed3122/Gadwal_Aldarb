import 'package:flutter/material.dart';
import 'package:gadwal_aldarb_res/consts.dart';
import 'package:gadwal_aldarb_res/layouts/tablet_layout.dart';
import 'package:gadwal_aldarb_res/views/drawer_view.dart';
import 'package:gadwal_aldarb_res/views/gadwal_aldarb_view.dart';

class DesktopLayout extends StatelessWidget {
  const DesktopLayout({
    super.key,
    required this.showGadwal,
    required this.number,
  });
  final OnTapItem showGadwal;
  final int? number;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(flex: 2, child: DrawerView(isDesktop: true)),
        Expanded(
          flex: 3,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: TabletLayout(showGadwal: showGadwal),
          ),
        ),
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.only(top: 5.0, right: 10),
            child: GadwalAldarbView(number: number),
          ),
        ),
      ],
    );
  }
}
