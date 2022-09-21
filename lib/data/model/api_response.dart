import 'dart:convert';

ApiResponse responseFromJson(String str) =>
    ApiResponse.fromJson(json.decode(str));

String responseToJson(ApiResponse res) => json.encode(res.toJson());

class ApiResponse {
  ApiResponse(
      {required this.success, required this.code, this.message, this.error});

  bool success;
  int code;
  String? message;
  dynamic error;

  factory ApiResponse.fromJson(Map<String, dynamic> json) => ApiResponse(
        success: json["success"],
        code: json["code"],
        message: json["message"] ?? '',
        error: json["error"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "code": code,
        "message": message,
        "error": error,
      };
}
