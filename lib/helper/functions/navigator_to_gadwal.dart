import 'package:flutter/material.dart';
import 'package:gadwal_aldarb/helper/services/user_services.dart';
import 'package:gadwal_aldarb/models/select_enum_gender.dart';
import 'package:gadwal_aldarb/views/gadwal_aldarb_view.dart';
import 'package:gadwal_aldarb/helper/services/tts_service.dart';

void navigatorToGadwalView(BuildContext context, {required int number}) {
  if (UserService.getCurrentUser()!.gender == Gender.male) {
    Speaker.instance.speak('مُمْتاز\n\n جدول الضرب$number');
  } else {
    Speaker.instance.speak('مُمْتازَهْ\n\n جدول الضرب$number');
  }

  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) {
        return GadwalAldarbView(number: number);
      },
    ),
  );
}
