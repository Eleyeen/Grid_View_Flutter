
class  SignUpResponesModel {
   final String message ;
   final String error;

   SignUpResponesModel({this.error,this.message});

     factory SignUpResponesModel.fromJson(Map<String, dynamic> json) {
    return SignUpResponesModel(
      message: json["message"] != null ? json["message"] : "",
      error: json["error"] != null ? json["error"] : "",
    );
  }

}

class SignUpRequestModel {
  String email;
  String password;
  String fristName;
  String lastName;
  String retype_password;

  SignUpRequestModel({
    this.email,
    this.password,
    this.retype_password,
    this.fristName,
    this.lastName
  });

  Map<String, dynamic> toJsonSignup() {
    Map<String, dynamic> map = {
      'email': email.trim(),
      'password': password.trim(),
      'first_name':fristName.trim(),
      'last_name':lastName.trim(),
      'retype_password':retype_password.trim()
    };

    return map;
  }
}