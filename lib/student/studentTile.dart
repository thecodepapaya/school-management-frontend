import 'package:flutter/material.dart';
import 'package:school_mgmt/models/student.dart';

class StudentTile extends StatelessWidget {
  final Student student;
  final Widget moreOptions;

  StudentTile({
    @required this.student,
    this.moreOptions,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(student.name),
        subtitle: Text(student.rollNumber),
        trailing: moreOptions,
      ),
    );
  }
}
