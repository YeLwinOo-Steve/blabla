import 'dart:convert';

RegisterModel registerModelFromJson(String str) => RegisterModel.fromJson(json.decode(str));

String registerModelToJson(RegisterModel data) => json.encode(data.toJson());

class RegisterModel {
  RegisterModel({
    required this.success,
    required this.token,
    required this.user,
  });

  bool success;
  String token;
  RegisterUser user;

  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
    success: json["success"],
    token: json["token"],
    user: RegisterUser.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "token": token,
    "user": user.toJson(),
  };
}

class RegisterUser {
  RegisterUser({
    required this.name,
    required this.phone,
    required this.isPhoneVerified,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });

  String name;
  String phone;
  bool isPhoneVerified;
  DateTime updatedAt;
  DateTime createdAt;
  int id;

  factory RegisterUser.fromJson(Map<String, dynamic> json) => RegisterUser(
    name: json["name"],
    phone: json["phone"],
    isPhoneVerified: json["is_phone_verified"],
    updatedAt: DateTime.parse(json["updated_at"]),
    createdAt: DateTime.parse(json["created_at"]),
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "phone": phone,
    "is_phone_verified": isPhoneVerified,
    "updated_at": updatedAt.toIso8601String(),
    "created_at": createdAt.toIso8601String(),
    "id": id,
  };
}
