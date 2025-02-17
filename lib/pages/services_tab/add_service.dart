import 'package:flutter/material.dart';
import 'package:white_label_business_app/common/widgets/custom_widgets.dart';
import 'package:white_label_business_app/constants/color_constants.dart';
import 'package:white_label_business_app/constants/texts_constants.dart';

class AddService extends StatelessWidget {

  final String data;
  AddService({required this.data});

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
                        MCustomWidgets.getCustomInputField(
                            caption: MConstants.customerName, hintText: ''),
                        MCustomWidgets.getCustomInputField(
                            caption: MConstants.service, hintText: ''),
                        MCustomWidgets.getCustomInputField(
                            caption: MConstants.worker, hintText: ''),
                        MCustomWidgets.getCustomInputField(
                            caption: MConstants.amount, hintText: ''),
                        Container(
                            margin: EdgeInsets.only(top: 25),
                            child: MCustomWidgets.getCustomButton(
                                MConstants.titleAddService, () {
                              // Add Service button clicked
                              Navigator.pop(context, 'Data from Second Page');
                            }))
                      ],
                    )))));
  }
}
