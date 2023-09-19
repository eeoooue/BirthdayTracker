import 'package:flutter/material.dart';

import 'birthdayprofile.dart';
import 'birthdaybar.dart';

class HomeFeed extends StatefulWidget {
  final List<BirthdayProfile> profiles;

  const HomeFeed(this.profiles, {super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomeFeedState(profiles);
  }
}

class _HomeFeedState extends State<HomeFeed> {
  final List<BirthdayProfile> profiles;

  _HomeFeedState(this.profiles);

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
            child: ListView.builder(
                itemCount: profiles.length,
                itemBuilder: (context, index) {
                  return BirthdayProfileBar(profiles[index]);
                }))
      ]),
    );
  }
}
