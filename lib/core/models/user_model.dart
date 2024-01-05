
import 'dart:convert';

class User {
  String name;
  String passwoed;

  User({
    required this.name,
    required this.passwoed,

  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    name: json["name"],
    passwoed: json["password"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "password": passwoed,
  };
}

User productFromJson(String str) => User.fromJson(json.decode(str));

String productToJson(User data) => json.encode(data.toJson());
