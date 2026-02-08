import 'package:flutter/material.dart';
import 'package:gadwal_aldarb_res/consts.dart';
import 'package:gadwal_aldarb_res/helper/functions/responsive_font_size.dart';
import 'package:gadwal_aldarb_res/widgets/list_gadwal_darb.dart';

class GadwalAldarbView extends StatelessWidget {
  const GadwalAldarbView({super.key, required this.number});
  final int? number;

  @override
  Widget build(BuildContext context) {
    double heightScreen = MediaQuery.sizeOf(context).width;
    bool desktop = heightScreen >= 1024;
    if (number == null) {
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
            'جدول ضرب رقم ($number)',
            style: TextStyle(
              color: Colors.white,
              fontSize: getResponsiveFontSize(context, baseFontSize: 25),
            ),
          ),
        ),
        body: ListGadwalDarb(number: number!),
      );
    }
  }
}
