import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:school_mgmt/data/studentData.dart';
import 'package:school_mgmt/models/class.dart';
import 'package:school_mgmt/models/student.dart';
import 'package:school_mgmt/student/studentTile.dart';

import '../models/teacher.dart';

class TeacherClass extends StatefulWidget {
  final Class teacherClass;
  final Teacher teacher;

  TeacherClass({
    @required this.teacherClass,
    @required this.teacher,
  });

  @override
  _TeacherClassState createState() => _TeacherClassState();
}

class _TeacherClassState extends State<TeacherClass> {
  List<Student> studentList = List<Student>();

  @override
  void initState() {
    super.initState();
    StudentData.allStudents.forEach((student) {
      if (student.classId == widget.teacherClass.classId) {
        studentList.add(student);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard ${widget.teacherClass.className}"),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: studentList.length,
          itemBuilder: (context, int i) {
            return StudentTile(
              student: studentList[i],
              moreOptions: PopupMenuButton<int>(
                tooltip: "More options",
                onSelected: (val) {
                  if (val == 0) {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        var cont = TextEditingController();
                        return AlertDialog(
                          title: Text("Update attendance"),
                          content: TextFormField(
                            controller: cont,
                          ),
                          actions: [
                            FlatButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text("cancel"),
                            ),
                            FlatButton(
                              onPressed: () {},
                              child: Text("update"),
                            ),
                          ],
                        );
                      },
                    );
                  } else {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        var cont = TextEditingController();
                        return AlertDialog(
                          title: Text("create result"),
                          content: TextFormField(
                            controller: cont,
                          ),
                          actions: [
                            FlatButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text("cancel"),
                            ),
                            FlatButton(
                              onPressed: () {},
                              child: Text("update"),
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                itemBuilder: (context) {
                  return <PopupMenuEntry<int>>[
                    PopupMenuItem<int>(
                      child: Text("Update attendance"),
                      value: 0,
                    ),
                    PopupMenuItem<int>(
                      child: Text("Create result"),
                      value: 1,
                    ),
                  ];
                },
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: "Create Assignment",
        child: Icon(Icons.add),
      ),
    );
  }
}
