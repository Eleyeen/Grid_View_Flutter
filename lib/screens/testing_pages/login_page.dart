import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_gridview/apis/api_service.dart';
import 'package:flutter_app_gridview/constants.dart';
import 'package:flutter_app_gridview/home.dart';
import 'package:flutter_app_gridview/models/login_model.dart';
import 'package:flutter_app_gridview/screens/Login/components/background_login.dart';
import 'package:flutter_app_gridview/screens/testing_pages/ProgressHUD.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool hidePassword = true;
  bool isApiCallProcess = false;
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  LoginRequestModel loginRequestModel;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();
    loginRequestModel = new LoginRequestModel();
  }

  @override
  Widget build(BuildContext context) {
    return ProgressHUD(
      child: _uiSetup(context),
      inAsyncCall: isApiCallProcess,
      opacity: 0.3,
    );
  }

  Widget _uiSetup(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BackGroundLogin(
      child: Scaffold(
        key: scaffoldKey,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                    margin: EdgeInsets.symmetric(vertical: 85, horizontal: 20),
                    child: Form(
                      key: globalFormKey,
                      child: Column(
                        children: <Widget>[
                          SizedBox(height: 20),
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
                          new TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            onSaved: (input) => loginRequestModel.email = input,
                            validator: (input) => !input.contains('@')
                                ? "Email Id should be valid"
                                : null,
                            decoration: new InputDecoration(
                              hintText: "Email Address",
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: KPrimaryColor)),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: KPrimaryColor),),
                              prefixIcon:
                                  Icon(Icons.email, color: KPrimaryColor),
                            ),
                          ),
                          SizedBox(height: 20),
                          new TextFormField(
                            style:
                                TextStyle(color: KPrimaryColor),
                            keyboardType: TextInputType.text,
                            onSaved: (input) =>
                                loginRequestModel.password = input,
                            validator: (input) => input.length < 5
                                ? "Password should be more than 5 characters"
                                : null,
                            obscureText: hidePassword,
                            decoration: new InputDecoration(
                              hintText: "Password",
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: KPrimaryColor)),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: KPrimaryColor)),
                              prefixIcon:
                                  Icon(Icons.lock, color: KPrimaryColor),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    hidePassword = !hidePassword;
                                  });
                                },
                                color: KPrimaryColor,
                                icon: Icon(hidePassword
                                    ? Icons.visibility_off
                                    : Icons.visibility),
                              ),
                            ),
                          ),
                          SizedBox(height: 30),
                          FlatButton(
                            padding: EdgeInsets.symmetric(
                                vertical: 12, horizontal: 80),
                            onPressed: () {
                              if (validateAndSave()) {
                                print(loginRequestModel.toJson());

                                setState(() {
                                  isApiCallProcess = true;
                                });

                                APIService apiService = new APIService();
                                apiService
                                    .login(loginRequestModel)
                                    .then((value) {
                                  if (value != null) {
                                    setState(() {
                                      isApiCallProcess = false;
                                    });

                                    if (value.token == "User Successfully Login") {
                                      final snackBar = SnackBar(
                                          content: Text("User Successfully Login"));

                                      scaffoldKey.currentState
                                          .showSnackBar(snackBar);
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) {
                                            return HomePage();
                                          },
                                        ),
                                      );
                                    } else if(value.token != "User Successfully Login") {
                                      final snackBar =
                                          SnackBar(content: Text("Error"));
                                      scaffoldKey.currentState
                                          .showSnackBar(snackBar);
                                    }
                                  }
                                });
                              }
                            },
                            child: Text(
                              "Login",
                              style: TextStyle(color: Colors.white),
                            ),
                            color: Theme.of(context).accentColor,
                            shape: StadiumBorder(),
                          ),
                          SizedBox(height: 15),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
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
