import 'package:flutter/material.dart';
import 'package:white_label_business_app/pages/authentication/login_page.dart';
import 'package:white_label_business_app/common/widgets/custom_widgets.dart';
import 'package:white_label_business_app/constants/texts_constants.dart';
import 'package:white_label_business_app/constants/color_constants.dart';
import 'package:white_label_business_app/constants/image_constants.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  flex: 8, // 80% of the screen
                  child: SizedBox(
                    width: double.infinity,
                    child: Image(
                        image: AssetImage(MImageConstants.welcomeBackground),
                        fit: BoxFit.fill),
                  ),
                ),
                Expanded(
                  flex: 2, // Remaining 20%
                  child: SizedBox(),
                ),
              ],
            ),
            Column(
              children: [
                Expanded(
                    flex: 7, // 80% of the screen
                    child: Container()),
                Expanded(
                  flex: 3, // Remaining 20%
                  child: Padding(
                      padding: EdgeInsets.all(24),
                      child: Column(
                          spacing: 20,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(MConstants.welcomeTitle,
                                style: MCustomWidgets.textStyle(
                                    fontSize: 40, fontWeight: FontWeight.bold)),
                            Text(
                              MConstants.welcomeCaption,
                              style: MCustomWidgets.textStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                  color: MColors.secondaryTextColor),
                            )
                          ]),
                )),
              ],
            )
          ],
        ),
        floatingActionButton: Row(
          spacing: 10,
        mainAxisAlignment: MainAxisAlignment.end, // Aligns the FAB and Text together
          children: [
            Text("Continue", style: MCustomWidgets.textStyle(fontSize: 16, fontWeight: FontWeight.normal)),
           SizedBox(height: 70, width: 70, child:
           Stack(clipBehavior: Clip.none, children: [
             Align(
             alignment: Alignment.centerRight,
                 child:
             FloatingActionButton(
              foregroundColor: MColors.primaryAppColor,
              backgroundColor: MColors.primaryAppColor,
              onPressed: () => onNextClicked(context),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
            )),
             IgnorePointer(
               ignoring: true, // Allows touches to pass through this widget
             child:
            Align(alignment: Alignment.centerLeft, child: Image(
               alignment: Alignment.centerLeft,
               image: AssetImage(MImageConstants.goNextIcon),
               fit: BoxFit.fitWidth, width: 55, height: 40)))
           ])),
          ],
        )
    );
  }

  void onNextClicked(BuildContext context) {
      Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => LoginPage()));
  }
}
