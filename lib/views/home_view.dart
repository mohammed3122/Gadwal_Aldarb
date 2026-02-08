import 'package:flutter/material.dart';
import 'package:gadwal_aldarb_res/helper/adaptive_layout.dart';
import 'package:gadwal_aldarb_res/helper/functions/navigator_to_gadwal.dart';
import 'package:gadwal_aldarb_res/helper/functions/responsive_font_size.dart';
import 'package:gadwal_aldarb_res/layouts/desktop_layout.dart';
import 'package:gadwal_aldarb_res/layouts/mobile_layout.dart';
import 'package:gadwal_aldarb_res/layouts/tablet_layout.dart';
import 'package:gadwal_aldarb_res/views/drawer_view.dart';
import 'package:gadwal_aldarb_res/widgets/dev_button.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int? selectNumber;
  @override
  Widget build(BuildContext context) {
    double heightScreen = MediaQuery.sizeOf(context).width;
    bool desktop = heightScreen >= 1024;
    GlobalKey<ScaffoldState> scafoldKey = GlobalKey();
    return Scaffold(
      key: scafoldKey,
      drawer: desktop ? null : DrawerView(isDesktop: desktop),
      appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(30),
            bottomLeft: Radius.circular(30),
          ),
        ),
        leading: desktop ? null : DevButton(scafoldKey: scafoldKey),
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
        tabletLayout: (context) => TabletLayout(
          showGadwal: (int number) =>
              navigatorToGadwalView(context, number: number),
        ),
        destopLayout: (context) => DesktopLayout(
          showGadwal: (int number) {
            setState(() {
              selectNumber = number;
            });
          },
          number: selectNumber,
        ),
      ),
    );
  }
}
