import 'package:flutter/material.dart';
import 'package:gadwal_aldarb/consts.dart';
import 'package:gadwal_aldarb/helper/adaptive_layout.dart';
import 'package:gadwal_aldarb/helper/functions/navigator_to_gadwal.dart';
import 'package:gadwal_aldarb/helper/functions/responsive_font_size.dart';
import 'package:gadwal_aldarb/helper/services/tts_service.dart';
import 'package:gadwal_aldarb/layouts/desktop_layout.dart';
import 'package:gadwal_aldarb/layouts/mobile_layout.dart';
import 'package:gadwal_aldarb/layouts/tablet_layout.dart';
import 'package:gadwal_aldarb/models/select_enum_gender.dart';
import 'package:gadwal_aldarb/views/drawer_view.dart';
import 'package:gadwal_aldarb/widgets/dev_button.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int? selectNumber;

  @override
  void initState() {
    super.initState();
    welcom();
  }

  Future<void> welcom() async {
    if (savedUser!.gender == Gender.male) {
      await Speaker.instance.speak(
        'السلام عليك يا ${savedUser!.name}  \n\n\n   يَلاَّ نَختَارْ رَقَمْ عَشان نِحفَظْ جَدْوَلْ ضَرْبُهْ',
      );
    } else {
      await Speaker.instance.speak(
        'السلام عليكي يا ${savedUser!.name}  \n\n\n   يَلاَّ نَختَارْ رَقَمْ عَشان نِحفَظْ جَدْوَلْ ضَرْبُهْ',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double heightScreen = MediaQuery.sizeOf(context).width;
    bool desktop = heightScreen >= 1024;
    GlobalKey<ScaffoldState> scafoldKey = GlobalKey();
    return Scaffold(
      backgroundColor: Colors.white,
      key: scafoldKey,
      drawer: desktop ? null : DrawerView(isDesktop: desktop),
      appBar: desktop
          ? null
          : AppBar(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(30),
                  bottomLeft: desktop
                      ? Radius.circular(0)
                      : Radius.circular(30),
                ),
              ),
              leading: desktop ? null : DevButton(scafoldKey: scafoldKey),
              centerTitle: true,
              titleSpacing: 18,
              backgroundColor: kMainColor(),
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
