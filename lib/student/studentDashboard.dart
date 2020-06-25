import 'package:flutter/material.dart';
import 'package:school_mgmt/models/student.dart';

class StudentDashboard extends StatefulWidget {
  final Student student;

  StudentDashboard(this.student);

  @override
  _StudentDashboardState createState() => _StudentDashboardState();
}

class _StudentDashboardState extends State<StudentDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Student Dashboard - ${widget.student.name}"),
      ),
      body: Center(),
    );
  }
}
