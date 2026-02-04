import 'package:flutter/material.dart';
import 'package:gadwal_aldarb_res/consts.dart';
import 'package:gadwal_aldarb_res/helper/functions/responsive_font_size.dart';
import 'package:gadwal_aldarb_res/widgets/list_item_drawer.dart';

class DrawerView extends StatelessWidget {
  const DrawerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: kMainColor,
      child: SizedBox(
        height: 900,
        child: Column(
          children: [
            // SizedBox(height: 100),
            Spacer(flex: 4),
            CircleAvatar(
              backgroundColor: kMainColor,
              radius: 80,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 78,
                backgroundImage: AssetImage('assets/images/developer/m_a.png'),
              ),
            ),
            Text(
              'Flutter Developer',
              style: TextStyle(
                fontSize: getResponsiveFontSize(context, baseFontSize: 30),
                color: Colors.white,
              ),
            ),
            Spacer(flex: 1),
            ListItemDrawer(),
            Spacer(flex: 8),
          ],
        ),
      ),
    );
  }
}
