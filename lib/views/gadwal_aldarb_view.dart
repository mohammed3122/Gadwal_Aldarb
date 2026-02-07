import 'package:flutter/material.dart';
import 'package:gadwal_aldarb_res/consts.dart';
import 'package:gadwal_aldarb_res/helper/functions/responsive_font_size.dart';
import 'package:gadwal_aldarb_res/widgets/list_gadwal_darb.dart';

class GadwalAldarbView extends StatelessWidget {
  const GadwalAldarbView({super.key, required this.number});
  final dynamic number;

  @override
  Widget build(BuildContext context) {
    final bool showGadwal = number == 'no yet';
    return showGadwal
        ? Scaffold(
            body: Center(
              child: Container(
                width: 100,
                height: 100,
                color: Colors.red,
                child: Text(number.toString()),
              ),
            ),
          )
        : Scaffold(
            appBar: AppBar(
              iconTheme: IconThemeData(color: Colors.white),
              centerTitle: true,
              backgroundColor: kMainColor,
              title: Text(
                'جدول ضرب رقم ($number)',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: getResponsiveFontSize(context, baseFontSize: 30),
                ),
              ),
            ),
            body: ListGadwalDarb(number: number),
          );
  }
}
