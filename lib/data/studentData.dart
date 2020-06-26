import '../models/student.dart';
import 'package:http/http.dart';

class StudentData {
  static List<Student> allStudents = List();

  StudentData() {
    getAllStudents();
  }

  static Future getAllStudents() async {
    Response response =
        await get("https://studymanagement.herokuapp.com/students/student/");
    if (response.statusCode != 200) {
      print("Error, cannot fetch students");
    } else {
      allStudents = studentFromJson(response.body);
      print("Fetched latest students");
    }
  }

  static void refresh()async {
    await getAllStudents();
  }
}
