import 'package:flutter/material.dart';
import 'package:school_mgmt/models/class.dart';
import 'package:school_mgmt/models/teacher.dart';
import 'package:school_mgmt/teacher/teacherClass.dart';
import 'package:school_mgmt/widgets/entityCard.dart';

class TeacherDashboard extends StatelessWidget {
  final Teacher teacher;
  final List<Class> classes;

  TeacherDashboard(this.teacher, this.classes);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select Class"),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Center(
            child: GridView.count(
              crossAxisCount: 3,
              children: classes
                  .map(
                    (c) => EntityCard(
                      name: c.className,
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (BuildContext contect) {
                              return TeacherClass(
                                teacherClass: c,
                                teacher: teacher,
                              );
                            },
                          ),
                        );
                      },
                    ),
                  )
                  .toList(),
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   crossAxisAlignment: CrossAxisAlignment.center,
            //   children: [
            //     EntityCard(
            //       name: "Class 10",
            //       onPressed: () {
            //         Navigator.of(context).push(
            //           MaterialPageRoute(
            //             builder: (BuildContext contect) {
            //               return TeacherClass(
            //                 //TODO: remove dummy
            //                 teacherClass: "Class 10",
            //                 teacher: Teacher(
            //                   teacherId: 125,
            //                   firstName: "Space",
            //                   lastName: "Cow",
            //                   profilepic: null,
            //                 ),
            //               );
            //             },
            //           ),
            //         );
            //       },
            //     ),
            //     EntityCard(
            //       name: "Class 11",
            //       onPressed: () {
            //         Navigator.of(context).push(
            //           MaterialPageRoute(
            //             builder: (BuildContext contect) {
            //               return TeacherClass(
            //                 //TODO: remove dummy value
            //                 teacherClass: "Class 11",
            //                 teacher: Teacher(
            //                   teacherId: 125,
            //                   firstName: "Space",
            //                   lastName: "Cow",
            //                   profilepic: null,
            //                 ),
            //               );
            //             },
            //           ),
            //         );
            //       },
            //     ),
            //   ],
            // ),
          ),
        ),
      ),
    );
  }
}
