import 'package:flutter/material.dart';
import 'package:flutter_app_gridview/components/already_have_an_account_check.dart';
import 'package:flutter_app_gridview/components/rounded_button.dart';
import 'package:flutter_app_gridview/components/rounded_inputField.dart';
import 'package:flutter_app_gridview/components/rounded_password_field.dart';
import 'package:flutter_app_gridview/constants.dart';
import 'package:flutter_app_gridview/screens/Login/Login_screen.dart';
import 'package:flutter_app_gridview/screens/signUp/components/background_signup.dart';
import 'package:flutter_app_gridview/screens/signUp/components/or_divider.dart';
import 'package:flutter_app_gridview/screens/signUp/components/socal_icon.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http ;
class BodySignUP extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BackGroundSignUP(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Sign Up',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/icons/signup.svg",
              height: size.height * 0.25,
            ),
            RoundedInputField(
              icon: Icons.person,
              hintText: 'Enter a Name',
              onchanged: (value) {},
            ),
            RoundedInputField(
              icon: Icons.email,
              hintText: 'Enter a email',
              onchanged: (value) {},
            ),
            RoundedInputField(
              icon: Icons.phone,
              hintText: 'Enter a phone Number',
              onchanged: (value) {},
            ),
            RoundedPasswordField(
              hintText: 'Enter a Password',
              onchanged: (value) {},
            ),
            RoundedPasswordField(
              hintText: "Re Enter a Password",
              onchanged: (value) {},
            ),
            RoundedButton(
              textColor: KPrimaryLightColor,
              color: KPrimaryColor,
              text: 'Sign Up',

              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                );
              },
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            AlreadyHaveAnAccountCheck(
              login: false,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                );
              },
            ),
            OrDivider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SocalIcon(
                  iconSrc: "assets/icons/facebook.svg",
                  press: () {},
                ),
                SocalIcon(
                  iconSrc: "assets/icons/twitter.svg",
                  press: () {},
                ),
                SocalIcon(
                  iconSrc: "assets/icons/google-plus.svg",
                  press: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
