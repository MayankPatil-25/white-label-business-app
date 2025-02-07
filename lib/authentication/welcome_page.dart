import 'package:flutter/material.dart';
import 'package:white_label_business_app/authentication/login_page.dart';
import 'package:white_label_business_app/constants/texts_constants.dart';
import '../constants/color_constants.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomPage extends StatelessWidget {
  WelcomPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  flex: 8, // 80% of the screen
                  child: Container(
                    width: double.infinity,
                    child: Image(
                        image: AssetImage('assets/welcome_bg.png'),
                        fit: BoxFit.fill),
                  ),
                ),
                Expanded(
                  flex: 2, // Remaining 20%
                  child: Container(),
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
                            Text('Welcome',
                                style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                        color: Colors.black54,
                                        fontSize: 40,
                                        fontWeight: FontWeight.bold))),
                            Text(
                              MConstants.welcomeCaption,
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: MColors.secondaryTextColor),
                            )
                          ])),
                ),
              ],
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          foregroundColor: MColors.primaryAppColor,
          backgroundColor: MColors.primaryAppColor,
          onPressed: () => onNextClicked(context),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40)),
          child: Padding(padding: EdgeInsets.all(0), child: Image(
            image: AssetImage('assets/right_arrow_icon.png'),
            fit: BoxFit.fill, width: 40, height: 40,)),
        ));
  }

  void onNextClicked(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginPage()));
  }
}
