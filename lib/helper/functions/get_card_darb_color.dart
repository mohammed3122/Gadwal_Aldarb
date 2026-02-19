import 'package:flutter/material.dart';
import 'package:gadwal_aldarb_res/consts.dart';

Color getGadwalColor(int number) {
  switch (number) {
    case == 1:
      return kCardColors[0];
    case == 2:
      return kCardColors[1];
    case == 3:
      return kCardColors[2];
    case == 4:
      return kCardColors[3];
    case == 5:
      return kCardColors[4];
    case == 6:
      return kCardColors[5];
    case == 7:
      return kCardColors[6];
    case == 8:
      return kCardColors[7];
    case == 9:
      return kCardColors[8];
    case == 10:
      return kCardColors[9];
    case == 11:
      return kCardColors[10];
    case == 12:
      return kCardColors[11];
  }
  return kMainColor();
}
