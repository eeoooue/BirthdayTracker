import 'package:birthdaytracker/pages/homefeed.dart';
import 'package:birthdaytracker/pages/profiledirectory.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key}) {}

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: HomeFeed(),
      routes: {
        '/homefeed': (context) => HomeFeed(),
        '/profiledirectory': (context) => ProfileDirectory(),
      },
    );
  }
}
