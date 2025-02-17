

import 'package:flutter/material.dart';
import 'package:white_label_business_app/common/widgets/custom_widgets.dart';
import 'package:white_label_business_app/constants/color_constants.dart';
import 'package:white_label_business_app/constants/texts_constants.dart';

class BaseScaffold extends StatelessWidget {

  BaseScaffold({
    required this.title,
    required this.body,
    required this.floatingActionButton
  });

  final String title;
  final Widget body;
  final Widget floatingActionButton;
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
   return SafeArea(top: false,
      child: Stack(children: [Scaffold(
         appBar: AppBar(
           backgroundColor: MColors.primaryAppColor,
           title: Text(
             title,
             textAlign: TextAlign.center,
             style: MCustomWidgets.textStyle(fontSize: 40, color: MColors.buttonTextColor),
           ),
           automaticallyImplyLeading: false,
         ),
        body: body ?? Container(color: Colors.cyanAccent),
        floatingActionButton: floatingActionButton,
       ),
      if (_isLoading)
        Positioned.fill(child: Container(
          color: Colors.black.withOpacity(0.3), // Semi-transparent background
          child: Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            ),
          ),
        ))
      ])
   );
  }
}