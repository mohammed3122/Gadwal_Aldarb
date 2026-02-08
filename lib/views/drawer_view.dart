import 'package:flutter/material.dart';
import 'package:gadwal_aldarb_res/consts.dart';
import 'package:gadwal_aldarb_res/helper/functions/responsive_font_size.dart';
import 'package:gadwal_aldarb_res/widgets/list_item_drawer.dart';

class DrawerView extends StatelessWidget {
  const DrawerView({super.key, required this.isDesktop});
  final bool isDesktop;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: isDesktop ? Colors.transparent : kMainColor,
      child: ListView(
        // physics: NeverScrollableScrollPhysics(),
        children: [
          SizedBox(height: isDesktop ? 30 : 85),
          // Spacer(flex: 4),
          CircleAvatar(
            backgroundColor: isDesktop ? kMainColor : Colors.white,
            radius: 80,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 78,
              backgroundImage: AssetImage('assets/images/developer/m_a.png'),
            ),
          ),
          Center(
            child: FittedBox(
              child: Text(
                'Flutter Developer',
                style: TextStyle(
                  fontSize: getResponsiveFontSize(context, baseFontSize: 30),
                  color: isDesktop ? kMainColor : Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(height: 10),

          // Spacer(flex: 1),
          ListItemDrawer(isDesktop: isDesktop),
          // Spacer(flex: 8),
        ],
      ),
    );
  }
}
