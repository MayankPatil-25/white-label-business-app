import 'package:flutter/material.dart';
import 'package:white_label_business_app/common/widgets/custom_widgets.dart';
import 'package:white_label_business_app/constants/color_constants.dart';
import 'package:white_label_business_app/constants/texts_constants.dart';

class AddService extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: false,
        child: Scaffold(
            appBar: AppBar(
                backgroundColor: MColors.primaryAppColor,
                title: Text(
                  MConstants.titleAddService,
                  textAlign: TextAlign.center,
                  style: MCustomWidgets.textStyle(
                      fontSize: 40, color: MColors.buttonTextColor),
                )),
            body: Container(
                margin: EdgeInsets.only(top: 25),
                child: Container(
                    margin: EdgeInsets.all(20),
                    child: Column(
                      spacing: 19,
                      children: [
                        MCustomWidgets.getCustomInputFiled(
                            caption: MConstants.customerName, hintText: ''),
                        MCustomWidgets.getCustomInputFiled(
                            caption: MConstants.service, hintText: ''),
                        MCustomWidgets.getCustomInputFiled(
                            caption: MConstants.worker, hintText: ''),
                        MCustomWidgets.getCustomInputFiled(
                            caption: MConstants.amount, hintText: ''),
                        Container(
                            margin: EdgeInsets.only(top: 25),
                            child: MCustomWidgets.getCustomButton(
                                MConstants.titleAddService, () {
                              // Add Service button clicked
                            }))
                      ],
                    )))));
  }
}
