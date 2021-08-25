import 'package:flutter_app_gridview/models/get_data_model.dart';
import 'package:flutter_app_gridview/models/login_model.dart';
import 'package:flutter_app_gridview/models/signup_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class APIService {
  static const String _urlLogin = "https://shli.ie/api/login";
  static const String _urlSignUp = "https://shli.ie/api/signup";
  static const String _urlGetData =
      'https://donations.dahawwalur.org/api/getgroups';

  Future<LoginResponseModel> login(LoginRequestModel requestModel) async {
    final response = await http.post(_urlLogin, body: requestModel.toJson());
    if (response.statusCode == 200 || response.statusCode == 400) {
      return LoginResponseModel.fromJson(
        json.decode(response.body),
      );
    } else {
      throw Exception('Failed to load data!');
    }
  }

  Future<SignUpResponesModel> signup(
      SignUpRequestModel responesModelSignUp) async {
    final response =
        await http.post(_urlSignUp, body: responesModelSignUp.toJsonSignup());
    if (response.statusCode == 200 || response.statusCode == 400) {
      return SignUpResponesModel.fromJson(
        json.decode(response.body),
      );
    } else {
      throw Exception('Failed to load data!');
    }
  }

  Future<DataResponseModel> getdata(DataRequestModel responesModelData) async {
    final response = await http.get(_urlSignUp);
    if (response.statusCode == 200 || response.statusCode == 400) {
      
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      List<dynamic> data = jsonResponse['data'];

      return DataResponseModel.fromJson(
        json.decode(response.body),
      );
    } else {
      throw Exception('Failed to load data!');
    }
  }
}
