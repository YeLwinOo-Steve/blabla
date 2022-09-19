import 'dart:convert';

ApiResponse responseFromJson(String str) => ApiResponse.fromJson(json.decode(str));

String responseToJson(ApiResponse res) => json.encode(res.toJson());

class ApiResponse {
  ApiResponse({required this.success, required this.message, required this.errors, required this.data});

  bool success;
  String message;
  dynamic errors;
  dynamic data;

  factory ApiResponse.fromJson(Map<String, dynamic> json) => ApiResponse(
        success: json["success"],
        message: json["message"],
        errors: json["errors"],
        data: json["data"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "errors": errors,
        "data": data,
      };
}
