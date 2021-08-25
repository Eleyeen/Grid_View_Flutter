import 'package:flutter/material.dart';
import 'package:flutter_app_gridview/components/rounded_button.dart';
import 'package:flutter_app_gridview/constants.dart';
import 'package:flutter_app_gridview/screens/Login/Login_screen.dart';
import 'package:flutter_app_gridview/screens/signUp/SignUp_screen.dart';
import 'package:flutter_app_gridview/screens/testing_pages/login_page.dart';
import 'package:flutter_app_gridview/screens/testing_pages/signup_page.dart';
import 'package:flutter_app_gridview/screens/welcome/components/background.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Welcome to EA',
              style: TextStyle(
                fontSize: 20.0,
                color: KPrimaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            SvgPicture.asset(
              "assets/icons/chat.svg",
              height: size.height * 0.45,
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            RoundedButton(
              text: 'Login',
              color: KPrimaryColor,
              textColor: KPrimaryLightColor,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginPage();
                    },
                  ),
                );
              },
            ),
            RoundedButton(
              text: 'SignUp',
              color: KPrimaryLightColor,
              textColor: KPrimaryColor,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpPageS();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
