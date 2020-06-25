// To parse this JSON data, do
//
//     final teacher = teacherFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<Teacher> teacherFromJson(String str) =>
    List<Teacher>.from(json.decode(str).map((x) => Teacher.fromJson(x)));

String teacherToJson(List<Teacher> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Teacher {
  Teacher({
    @required this.teacherId,
    @required this.firstName,
    @required this.lastName,
    @required this.profilepic,
  });

  int teacherId;
  String firstName;
  String lastName;
  String profilepic;

  String get name => firstName + " " + lastName;

  factory Teacher.fromJson(Map<String, dynamic> json) => Teacher(
        teacherId: json["teacher_id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        profilepic: json["profilepic"],
      );

  Map<String, dynamic> toJson() => {
        "teacher_id": teacherId,
        "first_name": firstName,
        "last_name": lastName,
        "profilepic": profilepic,
      };
}
