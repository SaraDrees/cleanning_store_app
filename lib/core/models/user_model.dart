
import 'dart:convert';

class User {
  String name;
  String password;
  String ?role;

  User({
    required this.name,
    required this.password,
     this.role

  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    name: json["name"],
    password: json["password"],
    role: json['role']
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "password": password,
    'role' : role
  };
}

User productFromJson(String str) => User.fromJson(json.decode(str));

String productToJson(User data) => json.encode(data.toJson());
