
import 'dart:convert';

class User {
  String name;
  String password;
  bool ?role;

  User({
    required this.name,
    required this.password,
     this.role

  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    name: json["name"],
    password: json["password"],
    role: json['rule']
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "password": password,
    'rule' : role
  };
}

List<User> userFromJson(List str) => List<User>.from(str.map((x) => User.fromJson(x)));


String userToJson(User data) => json.encode(data.toJson());
