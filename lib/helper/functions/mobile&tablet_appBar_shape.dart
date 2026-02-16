import 'package:flutter/material.dart';

RoundedRectangleBorder mobileAndTabletShapeAppbar() {
  return RoundedRectangleBorder(
    borderRadius: BorderRadius.only(
      bottomRight: Radius.circular(30),
      bottomLeft: Radius.circular(30),
    ),
  );
}
