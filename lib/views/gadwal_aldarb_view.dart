import 'package:flutter/material.dart';
import 'package:gadwal_aldarb_res/consts.dart';
import 'package:gadwal_aldarb_res/helper/functions/arabic_digits.dart';
import 'package:gadwal_aldarb_res/helper/functions/desk_top_app_bar.dart';
import 'package:gadwal_aldarb_res/helper/functions/mobile&tablet_appBar_shape.dart';
import 'package:gadwal_aldarb_res/helper/functions/responsive_font_size.dart';
import 'package:gadwal_aldarb_res/helper/services/tts_service.dart';
import 'package:gadwal_aldarb_res/views/exam_view.dart';
import 'package:gadwal_aldarb_res/views/no_gadwal_view.dart';
import 'package:gadwal_aldarb_res/widgets/list_gadwal_darb.dart';

class GadwalAldarbView extends StatefulWidget {
  const GadwalAldarbView({super.key, this.number});
  static String id = 'GadwalAldarbView';
  final int? number;

  @override
  State<GadwalAldarbView> createState() => _GadwalAldarbViewState();
}

class _GadwalAldarbViewState extends State<GadwalAldarbView> {
  @override
  void dispose() {
    // ⛔ إيقاف الصوت عند الخروج من الصفحة
    Speaker.instance.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double heightScreen = MediaQuery.sizeOf(context).width;
    bool desktop = heightScreen >= 1024;
    if (widget.number == null) {
      return NoGadwalDarbView();
    } else {
      return Scaffold(
        backgroundColor: desktop ? Colors.transparent : null,
        appBar: AppBar(
          shape: desktop ? desktopAppBar() : mobileAndTabletShapeAppbar(),
          iconTheme: IconThemeData(color: Colors.white),
          centerTitle: true,

          backgroundColor: kMainColor(),
          title: Text(
            'جدول الضرب (${formatArabicNumber(widget.number!)})',
            style: TextStyle(
              color: Colors.white,
              fontSize: getResponsiveFontSize(context, baseFontSize: 25),
            ),
          ),
        ),
        body: ListGadwalDarb(number: widget.number!),
        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: kMainColor(),
          onPressed: () {
            Speaker.instance.speak(
              'شاطرْ يا مُهابْ \n\nاسْتَعِدَّ يَلَّا للإختبارْ',
            );
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return TypingExam(number: widget.number!);
                },
              ),
            );
          },
          label: Icon(Icons.quiz, color: Colors.white, size: 35),
        ),
      );
    }
  }
}
