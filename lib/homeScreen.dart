import 'package:flutter/material.dart';
import 'package:school_mgmt/teacher/teacherList.dart';

import 'global.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const double cardSize = 200;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Select your role",
              style: TextStyle(fontSize: 32),
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                entityCard(EntityType.teacher),
                entityCard(EntityType.student),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                entityCard(EntityType.guardian),
                entityCard(EntityType.administration),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget entityCard(EntityType entityType) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: RaisedButton(
        onPressed: () {
          switch (entityType) {
            case EntityType.student:
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext contect) {
                    return TeacherList();
                  },
                ),
              );
              break;
            case EntityType.teacher:
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext contect) {
                    return TeacherList();
                  },
                ),
              );
              break;
            case EntityType.guardian:
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext contect) {
                    return TeacherList();
                  },
                ),
              );
              break;
            case EntityType.administration:
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext contect) {
                    return TeacherList();
                  },
                ),
              );
              break;
            default:
          }
        },
        elevation: 20,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          height: cardSize,
          width: cardSize * 1.6,
          child: Center(
            child: Text(
              entityType.toString().substring(11),
            ),
          ),
        ),
      ),
    );
  }
}
