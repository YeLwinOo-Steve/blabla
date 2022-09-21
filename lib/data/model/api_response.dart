import 'dart:convert';

ApiResponse responseFromJson(String str) =>
    ApiResponse.fromJson(json.decode(str));

String responseToJson(ApiResponse res) => json.encode(res.toJson());

class ApiResponse {
  ApiResponse(
      {required this.success,
      required this.code,
      required this.error,
      this.data});

  bool success;
  int code;
  String error;
  dynamic data;

  factory ApiResponse.fromJson(Map<String, dynamic> json) => ApiResponse(
        success: json["success"],
        code: json["code"],
        error: json["error"],
        data: json["data"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "code": code,
        "error": error,
        "data": data,
      };
}
