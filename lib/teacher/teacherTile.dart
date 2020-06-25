import 'package:flutter/material.dart';
import '../models/teacher.dart';

class TeacherTile extends StatelessWidget {
  final Teacher teacher;

  TeacherTile(this.teacher);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(teacher.name),
      ),
    );
  }
}
