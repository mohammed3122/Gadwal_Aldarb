import 'package:flutter/material.dart';
import 'package:gadwal_aldarb_res/views/gadwal_aldarb_view.dart';

void navigatorToGadwalView(BuildContext context, {required int number}) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) {
        return GadwalAldarbView(number: number);
      },
    ),
  );
}
