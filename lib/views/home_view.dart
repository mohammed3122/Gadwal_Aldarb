import 'package:flutter/material.dart';
import 'package:gadwal_aldarb_res/helper/adaptive_layout.dart';
import 'package:gadwal_aldarb_res/helper/functions/responsive_font_size.dart';
import 'package:gadwal_aldarb_res/layouts/desktop_layout.dart';
import 'package:gadwal_aldarb_res/layouts/mobile_layout.dart';
import 'package:gadwal_aldarb_res/layouts/tablet_layout.dart';
import 'package:gadwal_aldarb_res/views/drawer_view.dart';
import 'package:gadwal_aldarb_res/widgets/dev_button.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> scafoldKey = GlobalKey();
    return Scaffold(
      key: scafoldKey,
      drawer: DrawerView(),
      appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(30),
            bottomLeft: Radius.circular(30),
          ),
        ),
        leading: DevButton(scafoldKey: scafoldKey),
        centerTitle: true,
        titleSpacing: 9,
        backgroundColor: Color(0xff338b7a),
        title: Text(
          'اختر رقم لعرض جدول ضربه',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: getResponsiveFontSize(context, baseFontSize: 25),
          ),
        ),
      ),
      body: AdaptiveLayout(
        mobileLayout: (context) => MobileLayout(),
        tabletLayout: (context) => TabletLayout(),
        destopLayout: (context) => DesktopLayout(),
      ),
    );
  }
}
