import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/student.dart';

class GuardianDashboard extends StatelessWidget {
  final Student student;

  GuardianDashboard(this.student);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Guardian Dashboard ${student.name}"),
      ),
      body: Center(
        child: FutureBuilder(
          future: http.get(
              "https://studymanagement.herokuapp.com/students/student/?format=json"),
          builder:
              (BuildContext context, AsyncSnapshot<http.Response> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError || snapshot.data.statusCode != 200) {
                return Text("Error occured");
              } else {
                // print(snapshot.data.body);
                List<Student> studentList = studentFromJson(snapshot.data.body);
                return ListView.builder(
                  itemCount: studentList.length,
                  itemBuilder: (context, int i) {
                    return viewStudent(
                      context,
                      studentList[i],
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
