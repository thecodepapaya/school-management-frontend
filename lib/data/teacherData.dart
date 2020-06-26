import 'dart:convert';

import 'package:http/http.dart';
import '../models/teacher.dart';

class TeacherData {
  static List<Teacher> allTeachers = List();

  TeacherData() {
    getAllTeachers();
  }

  static Future getAllTeachers() async {
    Response response =
        await get("https://studymanagement.herokuapp.com/teachers/teacher/");
    if (response.statusCode != 200) {
      print("Error, cannot fetch Teachers");
    } else {
      allTeachers = teacherFromJson(response.body);
      print("Fetched latest Teachers");
    }
  }

  static Future<void> refresh() async {
    await getAllTeachers();
  }

  static Future<Response> postData(Teacher teacher) async {
    Response response = await post(
      "https://studymanagement.herokuapp.com/teachers/teacher/",
      body: jsonEncode(teacher.toJson()),
      headers: {"Content-type": "application/json"},
    );
    // print(response.body);

    return response;
  }

  static Future<Response> putData(Teacher teacher) async {
    Response response = await put(
      "https://studymanagement.herokuapp.com/teachers/teacher/${teacher.teacherId}/",
      body: jsonEncode(teacher.toJson()),
      headers: {"Content-type": "application/json"},
    );
    return response;
  }
}
