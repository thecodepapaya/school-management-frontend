import 'package:flutter/material.dart';
import 'package:school_mgmt/data/studentData.dart';
import 'package:school_mgmt/models/student.dart';

class AdminStudent extends StatefulWidget {
  @override
  _AdminStudentState createState() => _AdminStudentState();
}

class _AdminStudentState extends State<AdminStudent> {
  List<Student> studentList = List();

  @override
  Widget build(BuildContext context) {
    studentList = StudentData.allStudents;
    return Scaffold(
      appBar: AppBar(
        title: Text("Student Admin panel"),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: studentList.length,
          itemBuilder: (BuildContext context, int index) {
            return studentCard(studentList[index]);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              var rno = TextEditingController();
              var fn = TextEditingController();
              var ln = TextEditingController();
              var dob = TextEditingController();
              var pp = TextEditingController();
              var att = TextEditingController();
              var gr = TextEditingController();
              var cl = TextEditingController();
              return AlertDialog(
                title: Text("Add student"),
                actions: [
                  FlatButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text("Cancel"),
                  ),
                  FlatButton(
                    onPressed: () async {
                      Student student = Student(
                        attendance: att.text,
                        classId: cl.text,
                        dob: DateTime.now(),
                        firstName: fn.text,
                        lastName: ln.text,
                        grade: gr.text,
                        profilepic: pp.text,
                        rollNumber: rno.text,
                      );
                      await StudentData.postData(student);
                      Navigator.of(context).pop();
                      await StudentData.refresh();
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
                        controller: rno,
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
                        controller: dob,
                        decoration: InputDecoration(hintText: "yyyy-mm-dd"),
                      ),
                      TextFormField(
                        controller: pp,
                        decoration:
                            InputDecoration(hintText: "profile pic url"),
                      ),
                      TextFormField(
                        controller: att,
                        decoration:
                            InputDecoration(hintText: "Attendance (0-100)"),
                      ),
                      TextFormField(
                        controller: gr,
                        decoration: InputDecoration(hintText: "Grade (0-100)"),
                      ),
                      TextFormField(
                        controller: cl,
                        decoration: InputDecoration(hintText: "Class"),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
        tooltip: "Add student",
        child: Icon(Icons.add),
      ),
    );
  }

  Widget studentCard(Student student) {
    TextEditingController erno =
        TextEditingController(text: student.rollNumber);
    TextEditingController efn = TextEditingController(text: student.firstName);
    TextEditingController eln = TextEditingController(text: student.lastName);
    TextEditingController edob =
        TextEditingController(text: student.dob.toString().substring(0, 10));
    TextEditingController epp = TextEditingController(text: student.profilepic);
    TextEditingController eatt =
        TextEditingController(text: student.attendance);
    TextEditingController egr = TextEditingController(text: student.grade);
    TextEditingController ecl = TextEditingController(text: student.classId);

    return Card(
      child: ListTile(
        title: Text(student.name),
        subtitle: Text(student.rollNumber),
        trailing: IconButton(
          icon: Icon(Icons.edit),
          onPressed: () {
            print(student.toJson());
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text("Update student details"),
                  actions: [
                    FlatButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text("Cancel"),
                    ),
                    FlatButton(
                      onPressed: () async {
                        Student student = Student(
                          attendance: eatt.text,
                          classId: ecl.text,
                          dob: DateTime.now(),
                          firstName: efn.text,
                          lastName: eln.text,
                          grade: egr.text,
                          profilepic: epp.text,
                          rollNumber: erno.text,
                        );
                        await StudentData.putData(student);
                        Navigator.of(context).pop();
                        await StudentData.refresh();
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
                          controller: erno,
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
                          controller: edob,
                          decoration: InputDecoration(hintText: "yyyy-mm-dd"),
                        ),
                        TextFormField(
                          controller: epp,
                          decoration:
                              InputDecoration(hintText: "profile pic url"),
                        ),
                        TextFormField(
                          controller: eatt,
                          decoration:
                              InputDecoration(hintText: "Attendance (0-100)"),
                        ),
                        TextFormField(
                          controller: egr,
                          decoration:
                              InputDecoration(hintText: "Grade (0-100)"),
                        ),
                        TextFormField(
                          controller: ecl,
                          decoration: InputDecoration(hintText: "Class"),
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
