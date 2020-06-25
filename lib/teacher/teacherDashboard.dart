import 'package:flutter/material.dart';
import 'package:school_mgmt/models/teacher.dart';
import 'package:school_mgmt/teacher/teacherClass.dart';
import 'package:school_mgmt/widgets/entityCard.dart';

class TeacherDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: Future.value(0),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Select your Class",
                  style: Theme.of(context).textTheme.headline4,
                ),
                SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    EntityCard(
                      name: "Class 10",
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (BuildContext contect) {
                              return TeacherClass(
                                //TODO: remove dummy
                                teacherClass: "Class 10",
                                teacher: Teacher(
                                  teacherId: 125,
                                  firstName: "Space",
                                  lastName: "Cow",
                                  profilepic: null,
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),
                    EntityCard(
                      name: "Class 11",
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (BuildContext contect) {
                              return TeacherClass(
                                //TODO: remove dummy value
                                teacherClass: "Class 11",
                                teacher: Teacher(
                                  teacherId: 125,
                                  firstName: "Space",
                                  lastName: "Cow",
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
              ],
            );
          },
        ),
      ),
    );
  }
}
