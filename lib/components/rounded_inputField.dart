import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_gridview/components/text_field_container.dart';
import 'package:flutter_app_gridview/constants.dart';
import 'package:flutter_app_gridview/models/login_model.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final IconData icon;
  final ValueChanged<String> onchanged;
  final Color colour;
  final KeyboardKey textInputType;
  final LoginRequestModel loginRequestModel;
  const RoundedInputField({
    Key key,
    this.textInputType,
    this.colour,
    this.loginRequestModel,
    this.controller,
    this.hintText,
    this.icon,
    this.onchanged,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        onSaved: (input) => loginRequestModel.email = input,
         validator: (input) => !input.contains('@')
                              ? "Email Id should be valid"
                              : null,
        onChanged: onchanged,
        cursorColor: KPrimaryColor,
        controller: controller,
        decoration: InputDecoration(
            icon: Icon(
              icon,
              color: KPrimaryColor,
            ),
            hintText: hintText,
            border: InputBorder.none),
      ),
    );
  }
}
