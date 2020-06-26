import 'dart:convert';

import '../models/student.dart';
import 'package:http/http.dart' as http;

class StudentData {
  static List<Student> allStudents = List();

  StudentData() {
    getAllStudents();
  }

  static Future getAllStudents() async {
    http.Response response = await http
        .get("https://studymanagement.herokuapp.com/students/student/");
    if (response.statusCode != 200) {
      print("Error, cannot fetch students");
    } else {
      allStudents = studentFromJson(response.body);
      print("Fetched latest students");
    }
  }

  static Future<void> refresh() async {
    await getAllStudents();
  }

  static Future<http.Response> postData(Student student) async {
    // print(student.toJson());
    http.Response response = await http.post(
      "https://studymanagement.herokuapp.com/students/student/",
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(student.toJson()),
    );
    return response;
  }

  static Future<http.Response> putData(Student student) async {
    http.Response response = await http.patch(
      "https://studymanagement.herokuapp.com/students/student/${student.rollNumber}/",
      headers: {"Content-type": "application/json"},
      body: jsonEncode(student.toJson()),
    );
    return response;
  }
}
