class DataResponseModel {
  final String token;
  final String error;

  DataResponseModel({this.token, this.error});

  factory DataResponseModel.fromJson(Map<String, dynamic> json) {
    return DataResponseModel(
      token: json["message"] != null ? json["message"] : "",
      error: json["error"] != null ? json["error"] : "",
    );
  }
}

class DataRequestModel {
  String id;
  String name;

  DataRequestModel({
    this.id,
    this.name,
  });

  Map<String, dynamic> toJsonData() {
    Map<String, dynamic> map = {
      'id': id.trim(),
      'name': name.trim(),
    };

    return map;
  }
}