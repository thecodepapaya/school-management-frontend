import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import '../models/guardian.dart';
import '../models/student.dart';

class GuardianDashboard extends StatelessWidget {
  final Student student;
  final Guardian guardian;

  GuardianDashboard(this.student, this.guardian);

  final EdgeInsetsGeometry tablePadding = EdgeInsets.all(10);

  @override
  Widget build(BuildContext context) {
    final tableTextStyle = Theme.of(context).textTheme.headline5;

    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome ${guardian.name}, Dashboard for ${student.name}"),
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
                  child: Image.network(student.profilepic),
                  radius: 80,
                ),
                SizedBox(width: 100),
                Text(
                  student.name,
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
                            child:
                                Text(student.firstName, style: tableTextStyle),
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
                            child:
                                Text(student.lastName, style: tableTextStyle),
                          ),
                        ],
                      ),
                      TableRow(
                        children: <Widget>[
                          Padding(
                            padding: tablePadding,
                            child: Text("Guardian name", style: tableTextStyle),
                          ),
                          Padding(
                            padding: tablePadding,
                            child: Text(guardian.name, style: tableTextStyle),
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
                            child:
                                Text(student.rollNumber, style: tableTextStyle),
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
                            child: Text(student.dob.toString(),
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
                  percent: double.parse(student.attendance) / 100,
                  center: Text("Attendance " + student.attendance + "%"),
                ),
                CircularPercentIndicator(
                  radius: 200,
                  lineWidth: 12,
                  percent: double.parse(student.grade) / 100,
                  center: Text("Grade " + student.grade + "%"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget viewStudent(BuildContext context, Student student) {
    return Card(
      child: Container(
        height: 200,
        width: 200,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  student.name,
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(
                  height: 50,
                ),
                Text("Attendance: " + student.attendance),
                SizedBox(
                  height: 50,
                ),
                Text("Grade: " + student.grade),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
