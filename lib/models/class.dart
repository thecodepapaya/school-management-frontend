// To parse this JSON data, do
//
//     final class = classFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<Class> classFromJson(String str) =>
    List<Class>.from(json.decode(str).map((x) => Class.fromJson(x)));

String classToJson(List<Class> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Class {
  Class({
    @required this.classId,
    @required this.className,
    @required this.teacher,
  });

  String classId;
  String className;
  int teacher;

  factory Class.fromJson(Map<String, dynamic> json) => Class(
        classId: json["class_id"],
        className: json["class_name"],
        teacher: json["teacher"],
      );

  Map<String, dynamic> toJson() => {
        "class_id": classId,
        "class_name": className,
        "teacher": teacher,
      };
}
