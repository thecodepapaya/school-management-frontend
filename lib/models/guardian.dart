// To parse this JSON data, do
//
//     final guardian = guardianFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<Guardian> guardianFromJson(String str) =>
    List<Guardian>.from(json.decode(str).map((x) => Guardian.fromJson(x)));

String guardianToJson(List<Guardian> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Guardian {
  Guardian({
    @required this.id,
    @required this.name,
    @required this.student,
  });

  int id;
  String name;
  String student;

  factory Guardian.fromJson(Map<String, dynamic> json) => Guardian(
        id: json["id"],
        name: json["name"],
        student: json["student"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "student": student,
      };
}
