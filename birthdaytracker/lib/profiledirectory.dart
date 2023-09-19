import 'package:flutter/material.dart';
import 'birthdaybar.dart';
import 'birthdayprofile.dart';
import 'directoryelements.dart';
import 'profilestore.dart';

class ProfileDirectory extends StatefulWidget {
  const ProfileDirectory({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ProfileDirectoryState();
  }
}

class _ProfileDirectoryState extends State<ProfileDirectory> {
  final List<BirthdayProfile> profiles =
      ProfileStore().getAlphabeticalOrdering();

  _ProfileDirectoryState();

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
      bottomNavigationBar: BottomNavigationBar(currentIndex: 1, items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.people), label: "People"),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
      ]),
      body: Column(children: [
        Expanded(
            child: ListView.builder(
                itemCount: profiles.length,
                itemBuilder: (context, index) {
                  return DirectoryProfile(profiles[index]);
                }))
      ]),
    );
  }
}
