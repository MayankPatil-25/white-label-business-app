import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../common/widgets/custom_font.dart';
import '../constants/color_constants.dart';
import '../constants/texts_constants.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

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
                      style: MTextStyle.textStyle(fontSize: 45),
                      textAlign: TextAlign.start),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                          color: MColors.primaryAppColor,
                          height: 5,
                          width: 100))
                ])));

    var credentialsWidget = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 18,
      children: [
        Text(MConstants.username,
            style: MTextStyle.textStyle(
              fontSize: 16,
            )),
        TextField(
            decoration: InputDecoration(
                labelText: MConstants.enterUsername,
                hintText: MConstants.username,
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                      color: MColors.textFieldColor), // Default border color
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                      color: MColors.textFieldSelectedColor,
                      width: 2.0), // Color when focused
                )),
            style: MTextStyle.textStyle(fontSize: 16)),
        Text(MConstants.password,
            style: MTextStyle.textStyle(
              fontSize: 16,
            )),
        TextField(
            obscureText: true,
            decoration: InputDecoration(
                labelText: MConstants.enterPassword,
                hintText: MConstants.password,
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                      color: MColors.textFieldColor), // Default border color
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                      color: MColors.textFieldSelectedColor,
                      width: 2.0), // Color when focused
                )),
            style: MTextStyle.textStyle(fontSize: 16)),
      ],
    );

    var checkBox = Padding(
        padding: EdgeInsets.zero,
        child: Checkbox(
            value: false,
            onChanged: OnRememberMeChecked,
            checkColor: MColors.primaryAppColor,
            semanticLabel: MConstants.rememberMe));

    var forgetPasswordWidget = Row(children: [
      Expanded(
          flex: 5,
          child: Row(children: [
            checkBox,
            Text(MConstants.rememberMe,
                style: MTextStyle.textStyle(fontSize: 14))
          ])),
      Expanded(
          flex: 5,
          child: TextButton(
              onPressed: onForgotPasswordClicked,
              child: Text(MConstants.forgotPassword,
                  style: MTextStyle.textStyle(fontSize: 14))))
    ]);

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
              child: const Text(
                MConstants.login,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            )));

    var signUpWidget = Row(children: [
      Expanded(
          flex: 5,
          child: Row(children: [
            checkBox,
            Text(MConstants.doNotHaveAnAccount,
                style: MTextStyle.textStyle(fontSize: 14))
          ])),
      Expanded(
          flex: 5,
          child: TextButton(
              onPressed: onSignUpClicked,
              child: Text(MConstants.signUp,
                  style: MTextStyle.textStyle(fontSize: 14))))
    ]);
    return Scaffold(
        body: SingleChildScrollView(
            child: Stack(children:
            [ SizedBox(
          width: double.infinity,
          height: height * 0.6,
          child: Image(
              image: AssetImage('assets/welcome_bg.png'),
              fit: BoxFit.fitWidth,
              alignment: Alignment.bottomCenter)),
      Column(children: [
        Expanded(flex: 4, child: Container()),
        Expanded(
          flex: 6,
          child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(spacing: 20, children: [
                signInTitleWidget,
                credentialsWidget,
                forgetPasswordWidget,
                loginButtonWidget,
                signUpWidget
              ])),
        )
      ]),
    ])
        )
    );
  }

  void OnRememberMeChecked(bool? value) {
    if (value != null) {}
  }

  void onForgotPasswordClicked() {}

  void onSignUpClicked() {}
}
