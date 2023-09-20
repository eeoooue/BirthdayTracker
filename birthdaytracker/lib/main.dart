import 'package:birthdaytracker/pages/home_feed.dart';
import 'package:birthdaytracker/pages/profile_directory.dart';
import 'package:birthdaytracker/pages/settings.dart';
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
        '/settings': (context) => SettingsPage(),
      },
    );
  }
}
