import 'package:flutter/material.dart';
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
                        // var key = GlobalKey<FormState>();
                        return AlertDialog(
                          title: Text("Update attendance"),
                          content: TextFormField(
                            // key: key,
                            controller: cont,
                            // inputFormatters: [
                            //   WhitelistingTextInputFormatter("[0-9]"),
                            // ],
                          ),
                          actions: [
                            FlatButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text("cancel"),
                            ),
                            FlatButton(
                              onPressed: () async {
                                print(studentList[i].dob.toString());
                                print(studentList[i]
                                    .dob
                                    .toString()
                                    .substring(0, 10));
                                // http.Response response =
                                await StudentData.putData(
                                  Student(
                                    rollNumber: studentList[i].rollNumber,
                                    firstName: studentList[i].firstName,
                                    lastName: studentList[i].lastName,
                                    dob: studentList[i].dob,
                                    profilepic: studentList[i].profilepic,
                                    attendance: cont.text,
                                    grade: studentList[i].grade,
                                    classId: studentList[i].classId,
                                  ),
                                );
                                Navigator.pop(context);
                                // print(response.body);
                              },
                              child: Text("Update"),
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
                          title: Text("Update result"),
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
                              onPressed: () async {
                                // http.Response response =
                                await StudentData.putData(
                                  Student(
                                    rollNumber: studentList[i].rollNumber,
                                    firstName: studentList[i].firstName,
                                    lastName: studentList[i].lastName,
                                    dob: studentList[i].dob,
                                    profilepic: studentList[i].profilepic,
                                    attendance: studentList[i].attendance,
                                    grade: cont.text,
                                    classId: studentList[i].classId,
                                  ),
                                );
                                Navigator.pop(context);
                                // print(response.body);
                              },
                              child: Text("Update"),
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
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
      //   tooltip: "Create Assignment",
      //   child: Icon(Icons.add),
      // ),
    );
  }
}
