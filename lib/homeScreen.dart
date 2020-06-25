import 'package:flutter/material.dart';
import 'package:school_mgmt/administration/adminDashboard.dart';
import 'package:school_mgmt/guardian/guardianDashboard.dart';
import 'package:school_mgmt/models/student.dart';
import 'package:school_mgmt/student/studentDashboard.dart';
import 'package:school_mgmt/teacher/teacherDashboard.dart';
import 'package:school_mgmt/teacher/teacherList.dart';

import 'widgets/entityCard.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Select your role",
              style: Theme.of(context).textTheme.headline4,
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                EntityCard(
                  name: "Teacher",
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext contect) {
                          return TeacherDashboard();
                        },
                      ),
                    );
                  },
                ),
                EntityCard(
                  name: "Student",
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext contect) {
                          return StudentDashboard(
                            //TODO: get actual students
                            Student(
                              attendance: "56",
                              grade: "AA",
                              rollNumber: "85214693",
                              firstName: "null",
                              lastName: "patel",
                              dob: DateTime.now(),
                              profilepic: null,
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                EntityCard(
                  name: "Guardian",
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext contect) {
                          return GuardianDashboard(
                            //TODO: get actual students
                            Student(
                              attendance: "56",
                              grade: "AA",
                              rollNumber: "85214693",
                              firstName: "null",
                              lastName: "patel",
                              dob: DateTime.now(),
                              profilepic: null,
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
                EntityCard(
                  name: "Administration",
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext contect) {
                          return AdminDashboard();
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
