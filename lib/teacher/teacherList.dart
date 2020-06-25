import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/teacher.dart';
import '../teacher/teacherTile.dart';

class TeacherList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Teacher Dashboard"),
      ),
      drawer: Drawer(),
      body: Center(
        child: FutureBuilder<http.Response>(
          initialData: http.Response("body", 404),
          future: http.get(
              "https://studymanagement.herokuapp.com/teachers/teacher/?format=json"),
          builder:
              (BuildContext context, AsyncSnapshot<http.Response> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError || snapshot.data.statusCode != 200) {
                return Text("Error occured, please try again later");
              } else {
                List<Teacher> teacherList = teacherFromJson(snapshot.data.body);
                return ListView.builder(
                  itemCount: teacherList.length,
                  itemBuilder: (context, int i) {
                    return TeacherTile(
                      teacherList[i],
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
}
