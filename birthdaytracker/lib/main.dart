import 'package:birthdaytracker/pages/homefeed.dart';
import 'package:birthdaytracker/pages/profiledirectory.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox("names");
  await Hive.openBox("bdays");

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

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
