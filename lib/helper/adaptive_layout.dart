import 'package:flutter/material.dart';

class AdaptiveLayout extends StatelessWidget {
  const AdaptiveLayout({
    super.key,
    required this.mobileLayout,
    required this.tabletLayout,
    required this.destopLayout,
  });
  final WidgetBuilder mobileLayout, tabletLayout, destopLayout;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 600) {
          return mobileLayout(context);
        } else if (constraints.maxWidth < 1024) {
          return tabletLayout(context);
        } else {
          return destopLayout(context);
        }
      },
    );
  }
}
