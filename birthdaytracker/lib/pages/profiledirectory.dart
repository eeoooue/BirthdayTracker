import 'dart:collection';

import 'package:birthdaytracker/pages/addprofile.dart';
import 'package:birthdaytracker/pages/homefeed.dart';
import 'package:birthdaytracker/pages/viewprofile.dart';
import 'package:flutter/material.dart';
import '../models/birthdayprofile.dart';
import '../widgets/directoryelements.dart';
import '../models/profilestore.dart';

class ProfileDirectory extends StatefulWidget {
  const ProfileDirectory({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ProfileDirectoryState();
  }
}

class _ProfileDirectoryState extends State<ProfileDirectory> {
  final List<DirectoryElement> elements = List.empty(growable: true);
  final bool includeSectionMarkers = true;

  _ProfileDirectoryState() {
    populateElements();
  }

  void _addProfile() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => AddProfile()));
  }

  void _navigateBottomBar(int index) {
    switch (index) {
      case 0:
        {
          Navigator.popAndPushNamed(context, "/homefeed");
        }
      case 1:
        {
          Navigator.popAndPushNamed(context, "/profiledirectory");
        }
    }
  }

  void populateElements() {
    ProfileStore store = ProfileStore();
    HashSet<String> seen = HashSet();

    for (BirthdayProfile profile in store.getAlphabeticalOrdering()) {
      String firstChar = profile.name[0];
      if (!seen.contains(firstChar)) {
        if (includeSectionMarkers) {
          elements.add(DirectorySectionMarker(firstChar));
        }

        seen.add(firstChar);
      }
      elements.add(DirectoryProfile(profile));
    }

    print("${elements.length} elements found");
  }

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
      bottomNavigationBar: BottomNavigationBar(
          onTap: _navigateBottomBar,
          currentIndex: 1,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.people), label: "People"),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: "Settings"),
          ]),
      floatingActionButton: SizedBox(
        height: 100,
        width: 100,
        child: FittedBox(
          child: FloatingActionButton(
              onPressed: () {
                _addProfile();
              },
              child: const Icon(Icons.add)),
        ),
      ),
      body: Column(children: [
        Expanded(
            child: ListView.builder(
                itemCount: elements.length,
                itemBuilder: (context, index) {
                  return elements[index];
                }))
      ]),
    );
  }
}
