import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TeacherList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    getData();
    return Center(
      child: FutureBuilder<http.Response>(
        future: http.get(
            "https://studymanagement.herokuapp.com/teachers/teacher/?format=json"),
        builder: (BuildContext context, AsyncSnapshot<http.Response> response) {
          // print(response);
          return Container();
        },
      ),
    );
  }

  void getData() async {
    http.Response response = await http.get(
        "https://studymanagement.herokuapp.com/teachers/teacher/?format=json");
    if (response.statusCode == 200) {
      print(response);
    } else {
      print("Error : "+response.body);
    }
  }
}
