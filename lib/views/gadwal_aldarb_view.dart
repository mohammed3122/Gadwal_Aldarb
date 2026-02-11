import 'package:flutter/material.dart';
import 'package:gadwal_aldarb_res/consts.dart';
import 'package:gadwal_aldarb_res/helper/functions/arabic_digits.dart';
import 'package:gadwal_aldarb_res/helper/functions/responsive_font_size.dart';
import 'package:gadwal_aldarb_res/helper/services/tts_service.dart';
import 'package:gadwal_aldarb_res/views/gadwal_test_view.dart';
import 'package:gadwal_aldarb_res/widgets/list_gadwal_darb.dart';

class GadwalAldarbView extends StatefulWidget {
  const GadwalAldarbView({super.key, this.number});
  final int? number;

  @override
  State<GadwalAldarbView> createState() => _GadwalAldarbViewState();
}

class _GadwalAldarbViewState extends State<GadwalAldarbView> {
  @override
  void dispose() {
    // ⛔ إيقاف الصوت عند الخروج من الصفحة
    TtsService.instance.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double heightScreen = MediaQuery.sizeOf(context).width;
    bool desktop = heightScreen >= 1024;
    if (widget.number == null) {
      return Center(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage('assets/images/noData.png'),
            ),
          ),
          width: 350,
          height: 350,
        ),
      );
    } else {
      return Scaffold(
        backgroundColor: desktop ? Colors.transparent : null,
        appBar: AppBar(
          shape: desktop
              ? RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(70),
                )
              : RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(30),
                    bottomLeft: Radius.circular(30),
                  ),
                ),
          iconTheme: IconThemeData(color: Colors.white),
          centerTitle: true,
          backgroundColor: kMainColor,
          title: Text(
            'جدول ضرب (${formatArabicNumber(widget.number!)})',
            style: TextStyle(
              color: Colors.white,
              fontSize: getResponsiveFontSize(context, baseFontSize: 25),
            ),
          ),
        ),
        body: ListGadwalDarb(number: widget.number!),
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: kMainColor,
          icon: Icon(Icons.quiz, color: Colors.orange),
          label: Text('اختبار', style: TextStyle(color: Colors.white)),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => GadwalTestView(number: widget.number!),
              ),
            );
          },
        ),
      );
    }
  }
}
