import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:school_mgmt/models/student.dart';
import 'package:school_mgmt/student/studentTile.dart';

import '../models/teacher.dart';

class TeacherClass extends StatefulWidget {
  final String teacherClass;
  final Teacher teacher;

  TeacherClass({
    @required this.teacherClass,
    @required this.teacher,
  });

  @override
  _TeacherClassState createState() => _TeacherClassState();
}

class _TeacherClassState extends State<TeacherClass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard ${widget.teacherClass}"),
      ),
      body: Center(
        child: FutureBuilder<http.Response>(
          initialData: http.Response("body", 404),
          future: http.get(
              "https://studymanagement.herokuapp.com/students/student/?format=json"),
          builder:
              (BuildContext context, AsyncSnapshot<http.Response> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError || snapshot.data.statusCode != 200) {
                return Text("Error occured, please try again later");
              } else {
                List<Student> studentList = studentFromJson(snapshot.data.body);
                return ListView.builder(
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
                );
              }
            } else {
              return CircularProgressIndicator();
            }
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
