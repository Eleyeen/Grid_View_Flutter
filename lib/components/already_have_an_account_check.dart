import 'package:flutter/material.dart';
import 'package:flutter_app_gridview/constants.dart';

class AlreadyHaveAnAccountCheck extends StatelessWidget {
  final bool login;
  final Function press;

  const AlreadyHaveAnAccountCheck({
    Key  key,
    this.login = true,
    this.press,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          login ? "don't have a  Account ? " : "Already have an Account",
          style: TextStyle(color: KPrimaryColor),
        ),
        GestureDetector(
          onTap: press,
          child: Text(
            login ? "Sing Up" : "Sign In",
            style: TextStyle(
              color: KPrimaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
