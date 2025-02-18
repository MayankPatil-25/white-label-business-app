import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:white_label_business_app/common/widgets/custom_widgets.dart';
import 'package:white_label_business_app/constants/color_constants.dart';
import 'package:white_label_business_app/pages/authentication/welcome_page.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Navigate to another screen after the animation
    Future.delayed(Duration(seconds: 4), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => WelcomePage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
          Expanded(
              flex: 7,
              child: Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Lottie.asset('assets/animation/splash_animation.json',
                      // path to the Lottie JSON file
                      width: double.infinity,
                      fit: BoxFit.fitWidth,
                      alignment: Alignment.bottomCenter)
              )
          ),
          Expanded(
              flex: 3,
              child: Align(
                  alignment: Alignment.center,
                  child: Text('मानस',
                      textAlign: TextAlign.end,
                      style: MCustomWidgets.textStyle(
                          fontSize: 50,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.normal))))
        ])));
  }
}
