import 'package:flutter/material.dart';
import 'package:gadwal_aldarb/helper/functions/navigator_to_gadwal.dart';
import 'package:gadwal_aldarb/widgets/image_welcome.dart';
import 'package:gadwal_aldarb/widgets/item_widget.dart';

class MobileLayout extends StatelessWidget {
  const MobileLayout({super.key});

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
        ImageWelcome(),
      ],
    );
  }
}
