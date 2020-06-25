import 'package:flutter/material.dart';
import 'package:school_mgmt/data/studentData.dart';
import 'package:school_mgmt/models/student.dart';

class AdminStudent extends StatefulWidget {
  AdminStudent();

  @override
  _AdminStudentState createState() => _AdminStudentState();
}

class _AdminStudentState extends State<AdminStudent> {
  List<Student> studentList = List();

  @override
  void initState() {
    super.initState();
    studentList = StudentData.allStudents;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Student Admin panel"),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: studentList.length,
          itemBuilder: (BuildContext context, int index) {
            return studentCard(studentList[index]);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: "Add student",
        child: Icon(Icons.add),
      ),
    );
  }

  Widget studentCard(Student student) {
    return Card(
      child: ListTile(
        title: Text(student.name),
        subtitle: Text(student.rollNumber),
      ),
    );
  }
}
