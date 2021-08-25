
import 'package:flutter/material.dart';
import 'package:flutter_app_gridview/apis/api_service.dart';
import 'package:flutter_app_gridview/components/already_have_an_account_check.dart';
import 'package:flutter_app_gridview/components/rounded_button.dart';
import 'package:flutter_app_gridview/components/text_field_container.dart';
import 'package:flutter_app_gridview/constants.dart';
import 'package:flutter_app_gridview/models/login_model.dart';
import 'package:flutter_app_gridview/screens/Login/components/background_login.dart';
import 'package:flutter_app_gridview/screens/second_screen_page.dart';
import 'package:flutter_app_gridview/screens/signUp/SignUp_screen.dart';
import 'package:flutter_app_gridview/screens/testing_pages/ProgressHUD.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;

class BodyLogin extends StatefulWidget {
  const BodyLogin({Key key}) : super(key: key);

  @override
  _BodyLoginState createState() => _BodyLoginState();
}

class _BodyLoginState extends State<BodyLogin> {
  bool hidePassword = true;
  bool isApiCallPress = false;

  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  LoginRequestModel loginRequestModel;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loginRequestModel = new LoginRequestModel();
  }

  Widget build(BuildContext context) {
    return ProgressHUD(
      child: _uiSetup(context),
      inAsyncCall: isApiCallPress,
      opacity: 0.3,
    );
  }

  void _OnPressed() {
    if (validateAndSave()) {
      print(loginRequestModel.toJson());
      setState(() {
        isApiCallPress = true;
      });

      APIService apiService = new APIService();
      apiService.login(loginRequestModel).then((value) {
        if (value != null) {
          setState(() {
            isApiCallPress = false;
          });
          if (value.token.isNotEmpty) {
            final snackBar = SnackBar(content: Text("User Login"));
            scaffoldKey.currentState.showSnackBar(snackBar);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return SecondScreenPage();
              }),
            );
          } else {
            final snackBar = SnackBar(content: Text(value.error));
            scaffoldKey.currentState.showSnackBar(snackBar);
          }
        }
      });
    }
  }

  @override
  Widget _uiSetup(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BackGroundLogin(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Login',
              style: TextStyle(
                color: KPrimaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            SvgPicture.asset(
              "assets/icons/login.svg",
              height: size.height * 0.35,
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            TextFieldContainer(
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                onSaved: (input) => loginRequestModel.email = input,
                validator: (input) =>
                    !input.contains('@') ? "Email Id should be valid" : null,
                cursorColor: KPrimaryColor,
                decoration: InputDecoration(
                    icon: Icon(
                      Icons.email,
                      color: KPrimaryColor,
                    ),
                    hintText: "Your Email",
                    border: InputBorder.none),
              ),
            ),
            TextFieldContainer(
              child: TextFormField(
                keyboardType: TextInputType.text,
                onSaved: (input) => loginRequestModel.password = input,
                validator: (input) => input.length < 3
                    ? "Password should be more than 3 characters"
                    : null,
                obscureText: hidePassword,
                cursorColor: KPrimaryColor,
                decoration: InputDecoration(
                  hintText: ' Enter a Password',
                  icon: Icon(
                    Icons.lock,
                    color: KPrimaryColor,
                  ),
                  suffixIcon: Icon(
                    Icons.visibility,
                    color: KPrimaryColor,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
            RoundedButton(
              text: "Login",
              color: KPrimaryColor,
              textColor: KPrimaryLightColor,
              press: () {
                _OnPressed();
              },
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            AlreadyHaveAnAccountCheck(
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen();
                    },
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }

  bool validateAndSave() {
    final form = globalFormKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }
}
