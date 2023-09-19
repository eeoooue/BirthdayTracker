import 'package:flutter/material.dart';
import 'birthdaybar.dart';
import 'profilestore.dart';

class HomeFeed extends StatefulWidget {
  const HomeFeed({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomeFeedState();
  }
}

class _HomeFeedState extends State<HomeFeed> {
  final ProfileStore store = ProfileStore();

  _HomeFeedState();

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
                itemCount: store.profiles.length,
                itemBuilder: (context, index) {
                  return BirthdayProfileBar(store.profiles[index]);
                }))
      ]),
    );
  }
}
