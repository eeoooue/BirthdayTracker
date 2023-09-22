import 'package:birthdaytracker/pages/home_feed.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox("names");
  await Hive.openBox("bdays");
  await Hive.openBox("pictures");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.purple)),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: const HomeFeed(),
      routes: {
        '/homefeed': (context) => const HomeFeed(),
      },
    );
  }
}
