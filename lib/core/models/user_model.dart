
import 'dart:convert';

class User {
  String name;
  String password;

  User({
    required this.name,
    required this.password,

  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    name: json["name"],
    password: json["password"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "password": password,
  };
}

User productFromJson(String str) => User.fromJson(json.decode(str));

String productToJson(User data) => json.encode(data.toJson());
