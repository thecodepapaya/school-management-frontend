import 'package:flutter/material.dart';
import 'package:school_mgmt/data/teacherData.dart';
import '../models/teacher.dart';

class AdminTeacher extends StatefulWidget {
  @override
  _AdminTeacherState createState() => _AdminTeacherState();
}

class _AdminTeacherState extends State<AdminTeacher> {
  List<Teacher> teacherList = List();

  @override
  void initState() {
    super.initState();
    teacherList = TeacherData.allTeachers;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Teacher Admin panel"),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: teacherList.length,
          itemBuilder: (BuildContext context, int index) {
            return teacherCard(teacherList[index]);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: "Add teacher",
        child: Icon(Icons.add),
      ),
    );
  }

  Widget teacherCard(Teacher teacher) {
    return Card(
      child: ListTile(
        title: Text(teacher.name),
      ),
    );
  }
}
