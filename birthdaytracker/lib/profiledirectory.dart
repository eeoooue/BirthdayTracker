import 'dart:collection';

import 'package:flutter/material.dart';
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
  final List<DirectoryElement> elements = List.empty(growable: true);
  final bool includeSectionMarkers = true;

  _ProfileDirectoryState() {
    populateElements();
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
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.people), label: "People"),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: "Settings"),
          ]),
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
