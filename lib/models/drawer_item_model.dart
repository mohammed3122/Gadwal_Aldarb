import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DrawerItemModel {
  final FaIconData icon;
  final String text;
  final Color iconColor;

  DrawerItemModel({
    required this.icon,
    required this.text,
    required this.iconColor,
  });
}
