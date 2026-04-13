import 'package:flutter/material.dart';
import 'package:gadwal_aldarb/consts.dart';
import 'package:gadwal_aldarb/helper/functions/responsive_font_size.dart';
import 'package:gadwal_aldarb/widgets/athar_modev.dart';
import 'package:gadwal_aldarb/widgets/list_item_drawer.dart';
import 'package:gadwal_aldarb/widgets/our_message.dart';

class DrawerView extends StatelessWidget {
  const DrawerView({super.key, required this.isDesktop});
  final bool isDesktop;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: isDesktop
          ? Color.fromARGB(255, 195, 223, 217)
          : kMainColor(),
      child: ListView(
        // physics: NeverScrollableScrollPhysics(),
        children: [
          SizedBox(height: isDesktop ? 30 : 50),
          // Spacer(flex: 4),
          CircleAvatar(
            backgroundColor: isDesktop ? kMainColor() : Colors.white,
            radius: 80,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 78,
              backgroundImage: AssetImage('assets/images/developer/m_a.png'),
            ),
          ),

          SizedBox(height: 20),
          ListItemDrawer(isDesktop: isDesktop),
          SizedBox(height: 20),
          OurMessageBtn(isDesktop: isDesktop),
          SizedBox(height: 80),
          AtharModev(isDesktop: isDesktop),
          SizedBox(height: 5),
          Center(
            child: Text(
              'جميع الحقوق محفوظة © 2026',
              style: TextStyle(
                fontSize: getResponsiveFontSize(context, baseFontSize: 15),
                color: isDesktop ? kMainColor() : Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
