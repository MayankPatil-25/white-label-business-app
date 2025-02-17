import 'package:flutter/material.dart';
import 'package:white_label_business_app/common/widgets/custom_widgets.dart';
import 'package:white_label_business_app/constants/color_constants.dart';
import 'package:white_label_business_app/constants/texts_constants.dart';

class AddCustomer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: false,
        child: Scaffold(
            appBar: AppBar(
                backgroundColor: MColors.primaryAppColor,
                title: Text(
                  MConstants.titleAddCustomer,
                  textAlign: TextAlign.center,
                  style: MCustomWidgets.textStyle(
                      fontSize: 40, color: MColors.buttonTextColor),
                )
            ),
            body: Container(
                margin: EdgeInsets.only(top: 25),
                child: Container(
                    margin: EdgeInsets.all(20),
                    child: Column(
                      spacing: 19,
                      children: [
                        MCustomWidgets.getCustomInputField(
                            caption: MConstants.customerName, hintText: ''),
                        MCustomWidgets.getCustomInputField(
                            caption: MConstants.mobileNumber, hintText: ''),
                        MCustomWidgets.getCustomInputField(
                            caption: MConstants.age, hintText: ''),
                        MCustomWidgets.getCustomInputField(
                            caption: MConstants.date, hintText: ''),
                        Container(
                            margin: EdgeInsets.only(top: 25),
                            child: MCustomWidgets.getCustomButton(
                                MConstants.titleAddCustomer, () {
                              // Add Service button clicked
                            }))
                      ],
                    )))));
  }
}
