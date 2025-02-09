import 'package:flutter/material.dart';

import '../../constants/color_constants.dart';
import '../../constants/texts_constants.dart';

class MCustomWidgets {
  static TextStyle textStyle(
      {required double fontSize,
      Color color = MColors.primaryTextColor,
      FontWeight fontWeight = FontWeight.bold}) {
    return TextStyle(
        fontSize: fontSize,
        fontFamily: MConstants.poppinsFont,
        color: color,
        fontWeight: fontWeight,
        fontStyle: FontStyle.normal);
  }

  static Widget getCustomInputFiled({required String caption, required String hintText, bool isSecure = false}) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
      Text(caption,
          style: MCustomWidgets.textStyle(
            fontSize: 16,
          )),
      TextField(
          obscureText: isSecure,
          decoration: InputDecoration(
              labelText: hintText,
              hintText: caption,
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                    color: MColors.textFieldColor), // Default border color
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                    color: MColors.textFieldSelectedColor,
                    width: 2.0), // Color when focused
              )),
          style: MCustomWidgets.textStyle(fontSize: 16))
    ]);
  }
}
