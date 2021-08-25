import 'package:flutter/foundation.dart';

class Users {
  String first_name;
  String last_name;
  String email;
  String password;
  String retype_password;

  factory Users.fromJson(Map<String, dynamic> responseData) {}
}
