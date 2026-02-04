import 'package:flutter/material.dart';

double getResponsiveFontSize(
  BuildContext context, {
  required double baseFontSize,
}) {
  double scaleFactor = getScaleFactor(context);
  double getResponsiveFontSize = baseFontSize * scaleFactor;
  double lowerLimit = baseFontSize * .8;
  double upperLimit = baseFontSize * 1.5;
  double finalResponsiveFontSize = getResponsiveFontSize.clamp(
    lowerLimit,
    upperLimit,
  );
  return finalResponsiveFontSize;
}

double getScaleFactor(BuildContext context) {
  double screenWidth = MediaQuery.sizeOf(context).width;
  if (screenWidth < 600) {
    return screenWidth / 400;
  } else if (screenWidth < 1024) {
    return screenWidth / 800;
  } else {
    return screenWidth / 1224;
  }
}
