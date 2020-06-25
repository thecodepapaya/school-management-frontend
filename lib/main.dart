import 'package:flutter/material.dart';

import 'init.dart';
import 'homeScreen.dart';

void main() {
  Init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "School Management",
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      // ),
      theme: ThemeData.dark(),
      home: HomeScreen(),
    );
  }
}
