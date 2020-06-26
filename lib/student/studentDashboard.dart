import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../models/student.dart';

class StudentDashboard extends StatefulWidget {
  final Student student;

  StudentDashboard(this.student);

  @override
  _StudentDashboardState createState() => _StudentDashboardState();
}

class _StudentDashboardState extends State<StudentDashboard> {
  TextStyle tableTextStyle;
  final EdgeInsetsGeometry tablePadding = EdgeInsets.all(10);

  @override
  Widget build(BuildContext context) {
    tableTextStyle = Theme.of(context).textTheme.headline5;

    return Scaffold(
      appBar: AppBar(
        title: Text("Student Dashboard - ${widget.student.name}"),
      ),
      body: Container(
        padding: EdgeInsets.all(80),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(widget.student.profilepic),
                  radius: 80,
                ),
                SizedBox(width: 100),
                Text(
                  widget.student.name,
                  style: Theme.of(context).textTheme.headline2,
                ),
              ],
            ),
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 50),
                  width: MediaQuery.of(context).size.width / 2,
                  child: Table(
                    children: <TableRow>[
                      TableRow(
                        children: <Widget>[
                          Padding(
                            padding: tablePadding,
                            child: Text("First name", style: tableTextStyle),
                          ),
                          Padding(
                            padding: tablePadding,
                            child: Text(widget.student.firstName,
                                style: tableTextStyle),
                          ),
                        ],
                      ),
                      TableRow(
                        children: <Widget>[
                          Padding(
                            padding: tablePadding,
                            child: Text("Last name", style: tableTextStyle),
                          ),
                          Padding(
                            padding: tablePadding,
                            child: Text(widget.student.lastName,
                                style: tableTextStyle),
                          ),
                        ],
                      ),
                      TableRow(
                        children: <Widget>[
                          Padding(
                            padding: tablePadding,
                            child: Text("ID", style: tableTextStyle),
                          ),
                          Padding(
                            padding: tablePadding,
                            child: Text(widget.student.rollNumber,
                                style: tableTextStyle),
                          ),
                        ],
                      ),
                      TableRow(
                        children: <Widget>[
                          Padding(
                            padding: tablePadding,
                            child: Text("Date of Birth", style: tableTextStyle),
                          ),
                          Padding(
                            padding: tablePadding,
                            child: Text(
                                widget.student.dob.toString().substring(0, 10),
                                style: tableTextStyle),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                CircularPercentIndicator(
                  radius: 200,
                  lineWidth: 12,
                  percent: double.parse(widget.student.attendance) / 100,
                  center: Text("Attendance " + widget.student.attendance + "%"),
                  progressColor: Colors.blue,
                ),
                CircularPercentIndicator(
                  radius: 200,
                  lineWidth: 12,
                  percent: double.parse(widget.student.grade) / 100,
                  center: Text("Grade " + widget.student.grade + "%"),
                  progressColor: Colors.blue,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
