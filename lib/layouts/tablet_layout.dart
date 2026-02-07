import 'package:flutter/material.dart';
import 'package:gadwal_aldarb_res/widgets/item_widget.dart';

typedef OnTapItem = void Function(int index);

class TabletLayout extends StatelessWidget {
  const TabletLayout({super.key, required this.showGadwal});
  final OnTapItem showGadwal;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 12,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        crossAxisCount: 2,
      ),
      itemBuilder: (context, index) {
        int number = index + 1;
        return Item(
          index: index,
          number: number,
          onTap: () => showGadwal(number),
        );
      },
    );
  }
}
