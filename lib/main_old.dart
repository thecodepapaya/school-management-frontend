import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "No-exam",
      home: School(),
    );
  }
}

class School extends StatefulWidget {
  @override
  _SchoolState createState() => _SchoolState();
}

class _SchoolState extends State<School> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Most of you don't have real problems, you are just too lazy and unmotivated.",style: TextStyle(
          fontSize: 32,
        ),),
      ),
    );
/*
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Dashboard",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.chat,
              color: Colors.grey,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.notifications,
              color: Colors.grey,
            ),
            onPressed: () {},
          ),
          CircleAvatar(),
          SizedBox(
            width: 10,
          ),
          Center(
            child: Text(
              "John Doe",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey),
            ),
          )
        ],
      ),
      body: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width / 6,
              minWidth: MediaQuery.of(context).size.width / 6,
            ),
            child: Container(
              color: Colors.black87,
              child: Column(
                children: [
                  DrawerHeader(
                    child: Center(
                      child: Text(
                        "Humandeck",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.hot_tub,
                      color: Colors.grey,
                    ),
                    title: Text(
                      "Dashboard",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.hot_tub,
                      color: Colors.grey,
                    ),
                    title: Text(
                      "Employee",
                      style: TextStyle(color: Colors.grey),
                    ),
                    trailing: Icon(
                      Icons.hot_tub,
                      color: Colors.red,
                    ),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.hot_tub,
                      color: Colors.grey,
                    ),
                    title: Text(
                      "Requests",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.hot_tub,
                      color: Colors.grey,
                    ),
                    title: Text(
                      "Recuitmemt",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ],
              ),
            ),
          ),
          ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 18 / 30,
              minWidth: MediaQuery.of(context).size.width * 18 / 30,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Card(
                      child: Container(
                        height: MediaQuery.of(context).size.height / 2.5,
                        width: 560,
                        child: Center(
                          child: Text("Hello Jonathan"),
                        ),
                      ),
                    ),
                    Card(
                      child: Container(
                        height: MediaQuery.of(context).size.height / 2.5,
                        width: 560,
                        child: Center(
                          child: Text("Evaluation Progress"),
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  // crossAxisAlignment: CrossAxisAlignment.stretch,
                  // mainAxisAlignment: MainAxisAlignment.start,
                  // mainAxisSize: MainAxisSize.max,
                  children: [
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(),
                                Text("User ka naam"),
                              ],
                            ),
                            Text("uska email@gmail.com"),
                            Text("bechare ka kaam"),
                            Icon(Icons.more_horiz),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(),
                                Text("User ka naam"),
                              ],
                            ),
                            Text("uska email@gmail.com"),
                            Text("bechare ka kaam"),
                            Icon(Icons.more_horiz),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(),
                                Text("User ka naam"),
                              ],
                            ),
                            Text("uska email@gmail.com"),
                            Text("bechare ka kaam"),
                            Icon(Icons.more_horiz),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(),
                                Text("User ka naam"),
                              ],
                            ),
                            Text("uska email@gmail.com"),
                            Text("bechare ka kaam"),
                            Icon(Icons.more_horiz),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(),
                                Text("User ka naam"),
                              ],
                            ),
                            Text("uska email@gmail.com"),
                            Text("bechare ka kaam"),
                            Icon(Icons.more_horiz),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(),
                                Text("User ka naam"),
                              ],
                            ),
                            Text("uska email@gmail.com"),
                            Text("bechare ka kaam"),
                            Icon(Icons.more_horiz),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(),
                                Text("User ka naam"),
                              ],
                            ),
                            Text("uska email@gmail.com"),
                            Text("bechare ka kaam"),
                            Icon(Icons.more_horiz),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                  ],
                ),
              ],
            ),
          ),
          ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 1.3 / 6,
              minWidth: MediaQuery.of(context).size.width * 1.3 / 6,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Card(
                  child: Container(
                    constraints: BoxConstraints(
                      maxHeight: MediaQuery.of(context).size.height / 6,
                    ),
                    color: Colors.purple,
                  ),
                ),
                Card(
                  child: Container(
                    constraints: BoxConstraints(
                      maxHeight: MediaQuery.of(context).size.height / 6,
                    ),
                    color: Colors.orange,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Card(
                      child: Container(
                        height: 190,
                        width: 190,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(
                              Icons.person_outline,
                              color: Colors.blue,
                            ),
                            Text("745"),
                            Text("Employees"),
                          ],
                        ),
                      ),
                    ),
                    Card(
                      child: Container(
                        height: 190,
                        width: 190,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(
                              Icons.person_outline,
                              color: Colors.blue,
                            ),
                            Text("745"),
                            Text("Employees"),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  child: Card(
                    child: Center(child: Text("Calender")),
                  ),
                  height: MediaQuery.of(context).size.height / 3,
                  width: double.maxFinite,
                ),
              ],
            ),
          ),
        ],
      ),
      drawer: Drawer(
        elevation: 0,
        child: Container(
          color: Colors.black87,
          child: Column(
            children: [
              DrawerHeader(
                child: Center(
                  child: Text(
                    "Humandeck",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.hot_tub,
                  color: Colors.grey,
                ),
                title: Text(
                  "Dashboard",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.hot_tub,
                  color: Colors.grey,
                ),
                title: Text(
                  "Employee",
                  style: TextStyle(color: Colors.grey),
                ),
                trailing: Icon(
                  Icons.hot_tub,
                  color: Colors.red,
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.hot_tub,
                  color: Colors.grey,
                ),
                title: Text(
                  "Requests",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.hot_tub,
                  color: Colors.grey,
                ),
                title: Text(
                  "Recuitmemt",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ],
          ),
        ),
      ),
    );*/
  }
}
