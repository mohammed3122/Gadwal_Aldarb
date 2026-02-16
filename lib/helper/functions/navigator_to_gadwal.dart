import 'package:flutter/material.dart';
import 'package:gadwal_aldarb_res/views/gadwal_aldarb_view.dart';
import 'package:gadwal_aldarb_res/helper/services/tts_service.dart';

void navigatorToGadwalView(BuildContext context, {required int number}) {
  Speaker.instance.speak('مُمْتاز\n\n جدول الضرب$number');
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) {
        return GadwalAldarbView(number: number);
      },
    ),
  );
}
