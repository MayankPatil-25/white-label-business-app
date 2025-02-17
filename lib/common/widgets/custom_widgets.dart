import 'package:flutter/material.dart';

import '../../constants/color_constants.dart';
import '../../constants/texts_constants.dart';

class MCustomWidgets {
  static TextStyle textStyle(
      {required double fontSize,
      Color color = MColors.primaryTextColor,
      FontWeight fontWeight = FontWeight.bold,
      FontStyle fontStyle = FontStyle.normal
      }) {
    return TextStyle(
        fontSize: fontSize,
        fontFamily: MConstants.poppinsFont,
        color: color,
        fontWeight: fontWeight,
        fontStyle: fontStyle);
  }

  static Widget getCustomInputField({required String caption, required String hintText, bool isSecure = false}) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
      Text(caption,
          style: MCustomWidgets.textStyle(
            fontSize: 16,
          )),TextField(
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

  static Widget getCustomInputFieldWithBloc({required String caption,
    required String hintText,
    required String? errorText,
    required TextEditingController controller,
    required void Function(String value) onTextChanged,
    bool isSecure = false}) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(caption,
              style: MCustomWidgets.textStyle(
                fontSize: 16,
              )),TextField(
              onChanged: onTextChanged,
              obscureText: isSecure,
              decoration: InputDecoration(
                  labelText: hintText,
                  hintText: caption,
                  errorText: errorText,
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


  static Widget getCustomButton(String title, void Function() action) {
    return SizedBox(
        width: double.infinity,
        child: ElevatedButton(
            onPressed: () => action(),
            style: ElevatedButton.styleFrom(
              backgroundColor: MColors.primaryAppColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
              child: Text(
                  title,
                  style: MCustomWidgets.textStyle(fontSize: 18.0,
                      color: MColors.buttonTextColor,
                      fontWeight: FontWeight.w500)
              ),
            )));
  }

  static FloatingActionButton getCustomFloatingButton(IconData? iconData,
      void Function() onButtonPressed) {
   return FloatingActionButton(
      foregroundColor: MColors.primaryAppColor,
      backgroundColor: MColors.primaryAppColor,
      onPressed: () => onButtonPressed(),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      child: Icon(Icons.content_cut_rounded, size: 30, color: MColors.buttonTextColor),
    );
  }
}
