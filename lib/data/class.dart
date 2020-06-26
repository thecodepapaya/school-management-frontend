import 'package:http/http.dart';

import '../models/class.dart';

class ClassData {
  static List<Class> allClasses = List();

  ClassData() {
    getAllClass();
  }

  static Future getAllClass() async {
    Response response = await get(
        "https://studymanagement.herokuapp.com/administration/class/");
    if (response.statusCode != 200) {
      print("Error, cannot fetch Class");
    } else {
      allClasses = classFromJson(response.body);
      print("Fetched latest Class");
    }
  }

  static void refresh() async {
    await getAllClass();
  }
}
