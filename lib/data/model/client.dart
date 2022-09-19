
import 'dart:convert';

ClientModel clientModelFromJson(String str) => ClientModel.fromJson(json.decode(str));

String clientModelToJson(ClientModel data) => json.encode(data.toJson());

class ClientModel {
  ClientModel({
    required this.status,
    required this.token,
    required this.user,
  });

  String status;
  String? token;
  User? user;

  factory ClientModel.fromJson(Map<String, dynamic> json) => ClientModel(
    status: json["status"],
    token: json["token"] ,
    user: json["user"]
  );

  Map<String, dynamic> toJson() => {
    "status": status == null ? null : status,
    "token": token == null ? null : token,
    "user": user == null ? null : user?.toJson(),
  };
}

class User {
  User({
    required this.id,
    required this.name,
    required this.phone,
    required this.profileImage,
    required this.isPhoneVerified,
    required this.createdAt,
    required this.updatedAt,
  });

  int? id;
  String? name;
  String? phone;
  String? profileImage;
  bool? isPhoneVerified;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"] == null ? null : json["id"],
    name: json["name"] == null ? null : json["name"],
    phone: json["phone"] == null ? null : json["phone"],
    profileImage: json["profile_image"] == null ? null : json["profile_image"],
    isPhoneVerified: json["is_phone_verified"] == null ? null : json["is_phone_verified"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "name": name == null ? null : name,
    "phone": phone == null ? null : phone,
    "profile_image": profileImage == null ? null : profileImage,
    "is_phone_verified": isPhoneVerified == null ? null : isPhoneVerified,
    "created_at": createdAt == null ? null : createdAt?.toIso8601String(),
    "updated_at": updatedAt == null ? null : updatedAt?.toIso8601String(),
  };
}
