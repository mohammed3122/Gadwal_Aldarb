import 'package:flutter/material.dart';
import 'package:gadwal_aldarb_res/views/gadwal_aldarb_view.dart';
import 'package:gadwal_aldarb_res/helper/services/tts_service.dart';

Future<void> navigatorToGadwalView(
  BuildContext context, {
  required int number,
  // required Color color,
}) async {
  await TtsService.instance.speak('مُمْتاز\n\n جدول الضرب$number');
  Navigator.push(
    // ignore: use_build_context_synchronously
    context,
    MaterialPageRoute(
      builder: (context) {
        return GadwalAldarbView(number: number);
      },
    ),
  );

  // Navigator.pushNamed(context, GadwalAldarbView.id);
}
