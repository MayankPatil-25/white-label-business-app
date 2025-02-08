import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/color_constants.dart';

class MTextStyle {
  static TextStyle textStyle({
    required double fontSize,
    Color color = MColors.primaryTextColor,
    FontWeight fontWeight = FontWeight.bold
  }) {
    return GoogleFonts.poppins(textStyle: TextStyle(
      fontSize: fontSize,
      color: color,
      fontWeight: fontWeight,
      fontStyle: FontStyle.normal
    ));
  }
}
