import 'package:flutter/material.dart';

import '../common/widgets/custom_widgets.dart';
import '../constants/color_constants.dart';
import '../constants/texts_constants.dart';

class LoginPage extends StatelessWidget {
    LoginPage({super.key});

    Checkbox? checkBox;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    var testColor = Color.fromARGB(100, 250, 150, 50);

    var signInTitleWidget = Align(
        alignment: Alignment.bottomLeft,
        child: Container(
            padding: const EdgeInsets.only(top: 30.0, bottom: 20.0),
            alignment: Alignment.bottomLeft,
            width: width / 2,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 10,
                children: [
                  Text(MConstants.signIn,
                      style: MCustomWidgets.textStyle(fontSize: 40),
                      textAlign: TextAlign.start),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        margin: EdgeInsets.only(left: 5),
                          color: MColors.primaryAppColor,
                          height: 5,
                          width: 80))
                ])));

    var credentialsWidget = Container( margin: EdgeInsets.only(top:10), // margin 10
        color: Colors.transparent,
        child: Column(
          spacing: 19,
      children: [
        MCustomWidgets.getCustomInputFiled(caption: MConstants.username, hintText: MConstants.enterUsername),
        MCustomWidgets.getCustomInputFiled(caption: MConstants.password, hintText: MConstants.enterPassword, isSecure: true),
      ],
    ));

    checkBox = Checkbox(
            value: false,
            onChanged: OnRememberMeChecked,
            checkColor: MColors.primaryAppColor,
            semanticLabel: MConstants.rememberMe,
            visualDensity: VisualDensity(horizontal: -4.0,vertical: 0), // Removes extra space
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    );

    var forgetPasswordWidget = SizedBox(
        child: Row(children: [
      Expanded(
          flex: 5,
          child: Row(
            spacing: 5,
              mainAxisSize: MainAxisSize.min, // Prevents extra spacing
              children: [
            checkBox!,
            TextButton(
               onPressed: () { OnRememberMeChecked(checkBox?.value); },
               style: TextButton.styleFrom(
                    padding: EdgeInsets.zero, // Remove extra paddingð
                    minimumSize: Size(0, 0), // Remove minimum button constraints
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap),
                child: Text(MConstants.rememberMe, style: MCustomWidgets.textStyle(fontSize: 14, fontWeight: FontWeight.normal, color: MColors.secondaryTextColor)),
                )
          ])),
      Expanded(
          flex: 5,
          child: Container(
              alignment: Alignment.centerRight,
              margin: EdgeInsets.zero,
              child: TextButton(
              onPressed: onForgotPasswordClicked,
                  style: TextButton.styleFrom(
                      padding: EdgeInsets.zero, // Remove extra padding
                      minimumSize: Size(0, 0), // Remove minimum button constraints
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap), // Shrink tap area
              child: Text(MConstants.forgotPassword,
                  textAlign: TextAlign.left,
                  style: MCustomWidgets.textStyle(fontSize: 14, fontWeight: FontWeight.w500, color: MColors.primaryAppColor)))))
    ]));

    var loginButtonWidget = SizedBox(
        width: double.infinity,
        child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: MColors.primaryAppColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
              child: Text(
                MConstants.login,
                style: MCustomWidgets.textStyle(fontSize: 18.0,
                    color: MColors.buttonTextColor,
                    fontWeight: FontWeight.w500)
              ),
            )));

    var signUpWidget = SizedBox(
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(MConstants.doNotHaveAnAccount,
                style: MCustomWidgets.textStyle(fontSize: 14, fontWeight: FontWeight.normal, color: MColors.secondaryTextColor))
          ,TextButton(
              onPressed: onSignUpClicked,
              child: Text(MConstants.signUp,
                  style: MCustomWidgets.textStyle(fontSize: 14, fontWeight: FontWeight.w500, color: MColors.primaryAppColor)))
    ]));

    return Scaffold(
        body: Stack(children: [
      SingleChildScrollView(
        child: Column(
            children: [SizedBox(
            height: height * 0.37,
            width: width,
          ),
              SizedBox(child: Padding(
              padding: EdgeInsets.all(20.0),
              // 🚀 Auto height management
              child: Column(
                  spacing: 10,
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    signInTitleWidget,
                    credentialsWidget,
                    forgetPasswordWidget,
                    Container(margin: EdgeInsets.only(top:35),child: loginButtonWidget),
                    signUpWidget
                  ]))),
        ]),
      ),
      SizedBox(
          width: double.infinity,
          height: height * 0.6,
          child: Image(
              image: AssetImage('assets/welcome_bg.png'),
              fit: BoxFit.fitWidth,
              alignment: Alignment.bottomCenter))
    ]));
  }

  void OnRememberMeChecked(bool? value) {

    if (checkBox != null) {

    }
  }

  void onForgotPasswordClicked() {}

  void onSignUpClicked() {}
}
