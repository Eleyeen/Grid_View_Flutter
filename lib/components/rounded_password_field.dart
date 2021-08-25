import 'package:flutter/material.dart';
import 'package:flutter_app_gridview/components/text_field_container.dart';
import 'package:flutter_app_gridview/constants.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onchanged;
  final String hintText;
  final TextEditingController controller;
  const RoundedPasswordField({
    Key key,
    this.onchanged,
    this.controller,
    this.hintText,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        obscureText: true,
        controller: controller,
        onChanged: onchanged,
        cursorColor: KPrimaryColor,
        decoration: InputDecoration(
          hintText: hintText,
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
    );
  }
}
