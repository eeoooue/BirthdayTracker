import 'dart:collection';
import 'package:flutter/material.dart';
import '../models/birthday_profile.dart';
import '../models/nav_helper.dart';
import '../widgets/directory_elements.dart';
import '../models/profile_store.dart';

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
  final NavigationHelper navHelper = NavigationHelper();

  _ProfileDirectoryState() {
    populateElements();
  }

  void _navigateBottomBar(int index) {
    navHelper.navigateBottomBar(context, index);
  }

  void populateElements() {
    ProfileStore store = ProfileStore();
    HashSet<String> seen = HashSet();

    for (BirthdayProfile profile in store.getAlphabeticalOrdering()) {
      String firstChar = profile.name[0].toUpperCase();
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
          items: navHelper.getNavBarItems()),
      floatingActionButton: SizedBox(
        height: 100,
        width: 100,
        child: FittedBox(
          child: FloatingActionButton(
              onPressed: () {
                navHelper.addProfile(context);
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