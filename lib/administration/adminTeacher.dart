import 'package:flutter/material.dart';
import 'package:school_mgmt/data/teacherData.dart';
import 'package:school_mgmt/models/teacher.dart';

class AdminTeacher extends StatefulWidget {
  @override
  _AdminTeacherState createState() => _AdminTeacherState();
}

class _AdminTeacherState extends State<AdminTeacher> {
  List<Teacher> teacherList = List();

  @override
  Widget build(BuildContext context) {
    teacherList = TeacherData.allTeachers;
    
    return Scaffold(
      appBar: AppBar(
        title: Text("Teacher Admin panel"),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: teacherList.length,
          itemBuilder: (BuildContext context, int index) {
            return teacherCard(teacherList[index]);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              var tid = TextEditingController();
              var fn = TextEditingController();
              var ln = TextEditingController();
              var pp = TextEditingController();
              return AlertDialog(
                title: Text("Add teacher"),
                actions: [
                  FlatButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text("Cancel"),
                  ),
                  FlatButton(
                    onPressed: () async {
                      Teacher teacher = Teacher(
                        firstName: fn.text,
                        lastName: ln.text,
                        profilepic: pp.text,
                        teacherId: int.parse(tid.text),
                      );
                      await TeacherData.postData(teacher);
                      Navigator.of(context).pop();
                      await TeacherData.refresh();
                      setState(() {});
                    },
                    child: Text("Add"),
                  ),
                ],
                content: Form(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFormField(
                        controller: tid,
                        decoration: InputDecoration(hintText: "ID"),
                      ),
                      TextFormField(
                        controller: fn,
                        decoration: InputDecoration(hintText: "First name"),
                      ),
                      TextFormField(
                        controller: ln,
                        decoration: InputDecoration(hintText: "Last name"),
                      ),
                      TextFormField(
                        controller: pp,
                        decoration:
                            InputDecoration(hintText: "profile pic url"),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
        tooltip: "Add teacher",
        child: Icon(Icons.add),
      ),
    );
  }

  Widget teacherCard(Teacher teacher) {
    TextEditingController eid =
        TextEditingController(text: teacher.teacherId.toString());
    TextEditingController efn = TextEditingController(text: teacher.firstName);
    TextEditingController eln = TextEditingController(text: teacher.lastName);
    TextEditingController epp = TextEditingController(text: teacher.profilepic);

    return Card(
      child: ListTile(
        title: Text(teacher.name),
        subtitle: Text(teacher.teacherId.toString()),
        trailing: IconButton(
          icon: Icon(Icons.edit),
          onPressed: () {
            print(teacher.toJson());
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text("Update teacher details"),
                  actions: [
                    FlatButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text("Cancel"),
                    ),
                    FlatButton(
                      onPressed: () async {
                        Teacher teacher = Teacher(
                          firstName: efn.text,
                          lastName: eln.text,
                          profilepic: epp.text,
                          teacherId: int.parse(eid.text),
                        );
                        await TeacherData.putData(teacher);
                        Navigator.of(context).pop();
                        await TeacherData.refresh();
                        setState(() {});
                      },
                      child: Text("Update"),
                    ),
                  ],
                  content: Form(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextFormField(
                          controller: eid,
                          decoration: InputDecoration(hintText: "ID"),
                        ),
                        TextFormField(
                          controller: efn,
                          decoration: InputDecoration(hintText: "First name"),
                        ),
                        TextFormField(
                          controller: eln,
                          decoration: InputDecoration(hintText: "Last name"),
                        ),
                        TextFormField(
                          controller: epp,
                          decoration:
                              InputDecoration(hintText: "profile pic url"),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
