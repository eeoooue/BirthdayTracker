import 'package:flutter/material.dart';

import 'mockbirthday.dart';

class HomeFeed extends StatefulWidget {
  const HomeFeed({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomeFeedState();
  }
}

class _HomeFeedState extends State<HomeFeed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            "BirthdayTracker",
            style: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.people), label: "People"),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
      ]),
      body: Column(children: [
        Container(
          height: 30,
          color: Colors.grey,
        ),
        Expanded(
            child: ListView(
          children: [
            BirthdayProfileBar(),
            BirthdayProfileBar(),
            BirthdayProfileBar(),
            BirthdayProfileBar(),
            BirthdayProfileBar(),
            BirthdayProfileBar(),
            BirthdayProfileBar(),
          ],
        ))
      ]),
    );
  }
}
