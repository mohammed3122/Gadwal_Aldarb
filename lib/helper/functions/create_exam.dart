import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:gadwal_aldarb_res/consts.dart';
import 'package:gadwal_aldarb_res/helper/functions/get_card_darb_color.dart';
import 'package:gadwal_aldarb_res/views/gadwal_aldarb_view.dart';

SpeedDialChild createExam({
  required GadwalAldarbView widget,
  required String label,
  required IconData icon,
  required Function()? onTap,
}) {
  return SpeedDialChild(
    label: label,
    labelStyle: TextStyle(
      fontSize: 20,
      color: kMainColor,
      fontWeight: FontWeight.bold,
    ),
    child: Icon(icon, size: 35, color: getGadwalColor(widget.number!)),
    onTap: onTap,
  );
}
