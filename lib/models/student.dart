// To parse this JSON data, do
//
//     final student = studentFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<Student> studentFromJson(String str) =>
    List<Student>.from(json.decode(str).map((x) => Student.fromJson(x)));

String studentToJson(List<Student> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Student {
  Student({
    @required this.rollNumber,
    @required this.firstName,
    @required this.lastName,
    @required this.dob,
    @required this.profilepic,
    @required this.attendance,
    @required this.grade,
    @required this.classId,
  });

  String rollNumber;
  String firstName;
  String lastName;
  DateTime dob;
  String profilepic;
  String attendance;
  String grade;
  String classId;

  String get name => firstName + " " + lastName;

  factory Student.fromJson(Map<String, dynamic> json) => Student(
        rollNumber: json["roll_number"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        dob: DateTime.parse(json["dob"]),
        profilepic: json["profilepic"],
        attendance: json["attendance"],
        grade: json["grade"],
        classId: json["class_name"],
      );

  Map<String, dynamic> toJson() => {
        "roll_number": rollNumber,
        "first_name": firstName,
        "last_name": lastName,
        "dob":
            "${dob.year.toString().padLeft(4, '0')}-${dob.month.toString().padLeft(2, '0')}-${dob.day.toString().padLeft(2, '0')}",
        "profilepic": profilepic,
        "attendance": attendance,
        "grade": grade,
        "class_name": classId,
      };
}
