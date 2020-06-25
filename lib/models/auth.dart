// To parse this JSON data, do
//
//     final auth = authFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

enum AuthType {
  student,
  teacher,
  guardian,
  administration,
}

List<Auth> authFromJson(String str) =>
    List<Auth>.from(json.decode(str).map((x) => Auth.fromJson(x)));

String authToJson(List<Auth> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Auth {
  Auth({
    @required this.id,
    @required this.username,
    @required this.password,
    @required this.role,
  });

  int id;
  String username;
  String password;
  String role;

  factory Auth.fromJson(Map<String, dynamic> json) => Auth(
        id: json["id"],
        username: json["username"],
        password: json["password"],
        role: json["role"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "password": password,
        "role": role,
      };
}
