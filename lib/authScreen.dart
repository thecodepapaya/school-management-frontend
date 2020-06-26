import 'package:flutter/material.dart';
import 'package:school_mgmt/administration/adminDashboard.dart';
import 'package:school_mgmt/data/authData.dart';
import 'package:school_mgmt/data/class.dart';
import 'package:school_mgmt/data/guardiansData.dart';
import 'package:school_mgmt/data/studentData.dart';
import 'package:school_mgmt/data/teacherData.dart';
import 'package:school_mgmt/guardian/guardianDashboard.dart';
import 'package:school_mgmt/homeScreen.dart';
import 'package:school_mgmt/models/auth.dart';
import 'package:school_mgmt/models/guardian.dart';
import 'package:school_mgmt/models/teacher.dart';
import 'package:school_mgmt/student/studentDashboard.dart';
import 'package:school_mgmt/teacher/teacherDashboard.dart';

import 'models/class.dart';
import 'models/student.dart';

class AuthScreen extends StatefulWidget {
  final AuthType authType;
  // final Widget nextscreen;

  AuthScreen({
    @required this.authType,
    // @required this.nextscreen,
  });

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> _key = GlobalKey<FormState>();
  List<Auth> authList = AuthData.allAuth;
  String role;
  Widget nextScreen;

  @override
  void initState() {
    super.initState();
    switch (widget.authType) {
      case AuthType.administration:
        role = "admin";
        break;
      case AuthType.student:
        role = "student";
        break;
      case AuthType.teacher:
        role = "teacher";
        break;
      case AuthType.guardian:
        role = "guardian";
        break;
      default:
        role = "unknown";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Authentication $role"),
      ),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width / 3,
          child: Form(
            key: _key,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Authentication",
                  style: Theme.of(context).textTheme.headline5,
                ),
                SizedBox(height: 80),
                TextFormField(
                  controller: usernameController,
                  decoration: InputDecoration(hintText: "Username"),
                ),
                SizedBox(height: 50),
                TextFormField(
                  controller: passwordController,
                  decoration: InputDecoration(hintText: "Password"),
                  obscureText: true,
                ),
                SizedBox(height: 50),
                RaisedButton(
                  child: Text("Login"),
                  onPressed: () {
                    if (_key.currentState.validate()) {
                      if (isValid()) {
                        nextScreen = getAppropriateEntity();
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => nextScreen,
                          ),
                        );
                      } else {
                        print("Invalid Creds");
                      }
                    } else {
                      print("Invalid");
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool isValid() {
    for (int i = 0; i < authList.length; i++) {
      if (usernameController.text == authList[i].username &&
          passwordController.text == authList[i].password &&
          role == authList[i].role) {
        return true;
      }
    }
    return false;
  }

  Widget getAppropriateEntity() {
    switch (widget.authType) {
      case AuthType.student:
        Student loginStudent = StudentData.allStudents.firstWhere(
            (student) => student.rollNumber == usernameController.text,
            orElse: () {
          print("No login credential for current student");
          return Student(
            classId: "1",
            rollNumber: "null",
            firstName: "null",
            lastName: "null",
            dob: DateTime.now(),
            profilepic: "null",
            attendance: "20",
            grade: "20",
          );
        });
        return StudentDashboard(loginStudent);
        break;

      case AuthType.teacher:
        Teacher loginTeacher = TeacherData.allTeachers.firstWhere(
            (teacher) =>
                teacher.teacherId.toString() == usernameController.text,
            orElse: () {
          print("No login credential for current teacher");
          return Teacher(
            teacherId: 526,
            firstName: "null",
            lastName: "null",
            profilepic: "null",
          );
        });
        List<Class> loginClasses = List<Class>();
        // print(ClassData.allClasses);
        ClassData.allClasses.forEach((c) {
          if (c.teacher == loginTeacher.teacherId) {
            loginClasses.add(c);
            print("Found one class for ${loginTeacher.name}");
          }
        });
        return TeacherDashboard(loginTeacher, loginClasses);
        break;

      case AuthType.guardian:
        Student loginStudent = StudentData.allStudents.firstWhere(
            (student) => student.rollNumber == usernameController.text,
            orElse: () {
          print("No login credential for current student of guardian");
          return Student(
            classId: "1",
            rollNumber: "null",
            firstName: "null",
            lastName: "null",
            dob: DateTime.now(),
            profilepic: "null",
            attendance: "20",
            grade: "10",
          );
        });
        Guardian loginGuardian = GuardianData.guardian.firstWhere(
            (guardian) => guardian.student == usernameController.text,
            orElse: () {
          print("No login cred for current guardian");
          return Guardian(id: -1, name: "null", student: "null");
        });
        return GuardianDashboard(loginStudent, loginGuardian);
        break;

      case AuthType.administration:
        return AdminDashboard();
        break;

      default:
        return HomeScreen();
    }
  }
}
