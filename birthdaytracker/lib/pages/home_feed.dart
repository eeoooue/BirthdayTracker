import 'dart:collection';

import 'package:birthdaytracker/models/hive_helper.dart';
import 'package:birthdaytracker/models/nav_helper.dart';
import 'package:birthdaytracker/models/profile_store.dart';
import 'package:birthdaytracker/widgets/directory_elements.dart';
import 'package:birthdaytracker/widgets/my_app_bar.dart';
import 'package:birthdaytracker/widgets/neutral_action_button.dart';
import 'package:flutter/material.dart';
import '../models/time_helper.dart';
import '../models/birthday_profile.dart';
import '../widgets/birthday_profile_bar.dart';
import '../widgets/current_date_banner.dart';

class HomeFeed extends StatefulWidget {
  const HomeFeed({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomeFeedState();
  }
}

class _HomeFeedState extends State<HomeFeed> {
  final List<BirthdayProfile> profiles = TimeHelper().getClosestBirthdays();
  final NavigationHelper navHelper = NavigationHelper();
  int pageIndex = 0;
  Widget activePageBody = Container();
  bool showFloatingBtn = false;

  _HomeFeedState() {
    activePageBody = getHomeBody();
  }

  void _navigateBottomBar(int index) {
    pageIndex = index;

    setState(() {
      showFloatingBtn = false;

      switch (pageIndex) {
        case 1:
          {
            showFloatingBtn = true;
            activePageBody = getDirectoryBody();
          }
        case 2:
          {
            activePageBody = getSettingsBody();
          }
        default:
          {
            activePageBody = getHomeBody();
          }
      }
    });
  }

  void _clearData() {
    HiveHelper.clearData();
  }

  Widget getHomeBody() {
    return Column(children: [
      const CurrentDateBanner(),
      Expanded(
          child: ClipRect(
        child: ListView.builder(
            itemCount: profiles.length,
            itemBuilder: (context, index) {
              return BirthdayProfileBar(profiles[index]);
            }),
      ))
    ]);
  }

  Widget getDirectoryBody() {
    List<DirectoryElement> elements = getDirectoryElements();

    return Column(children: [
      Expanded(
          child: ListView.builder(
              itemCount: elements.length,
              itemBuilder: (context, index) {
                return elements[index];
              }))
    ]);
  }

  Widget getSettingsBody() {
    return Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [NeutralActionButton("Clear Data", _clearData)]),
    );
  }

  List<DirectoryElement> getDirectoryElements() {
    List<DirectoryElement> elements = List.empty(growable: true);
    ProfileStore store = ProfileStore();
    HashSet<String> seen = HashSet();

    bool includeSectionMarkers = true;

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

    return elements;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      backgroundColor: Colors.grey[300],
      floatingActionButton: Visibility(
        visible: showFloatingBtn,
        child: SizedBox(
          height: 100,
          width: 100,
          child: FittedBox(
            child: FloatingActionButton(
                backgroundColor: const Color.fromRGBO(155, 80, 148, 1),
                onPressed: () {
                  navHelper.addProfile(context);
                },
                child: const Icon(Icons.add)),
          ),
        ),
      ),
      bottomNavigationBar:
          navHelper.getBottomNav(_navigateBottomBar, pageIndex),
      body: activePageBody,
    );
  }
}
