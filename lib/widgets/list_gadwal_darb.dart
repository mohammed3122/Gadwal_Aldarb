import 'package:flutter/material.dart';
import 'package:gadwal_aldarb_res/widgets/card_darb_widget.dart';

class ListGadwalDarb extends StatelessWidget {
  const ListGadwalDarb({super.key, required this.number});
  final int number;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 13,
      itemBuilder: (context, index) {
        return DarbCard(number: number, index: index);
      },
    );
  }
}
