import 'package:flutter_app_gridview/components/users.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UsersPreferences {
  Future<bool> saveUser(Users user) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    sharedPreferences.setString("first_name", user.first_name);
    sharedPreferences.setString("last_name", user.last_name);
    sharedPreferences.setString("email", user.email);
    sharedPreferences.setString("password", user.password);
    sharedPreferences.setString("retype_password", user.retype_password);

    return sharedPreferences.commit();
  }
}
