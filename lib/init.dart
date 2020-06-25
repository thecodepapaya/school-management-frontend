import 'package:school_mgmt/data/authData.dart';
import 'package:school_mgmt/data/studentData.dart';
import 'package:school_mgmt/data/teacherData.dart';

enum EntityType {
  student,
  teacher,
  administration,
  guardian,
}

class Init {
  Init() {
    StudentData();
    TeacherData();
    AuthData();
  }
}
