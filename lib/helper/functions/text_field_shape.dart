import 'package:flutter/material.dart';
import 'package:gadwal_aldarb/consts.dart';

OutlineInputBorder textFieldShape() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(30),
    borderSide: BorderSide(width: 2, color: kMainColor()),
  );
}
