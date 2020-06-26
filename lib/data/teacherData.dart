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

  static void refresh() async {
    await getAllTeachers();
  }
}
