import 'package:birthdaytracker/models/birthday_profile.dart';
import 'package:birthdaytracker/pages/edit_profile.dart';
import 'package:flutter/material.dart';
import '../pages/add_profile.dart';

class NavigationHelper {
  void navigateHome(BuildContext context) {
    while (Navigator.canPop(context)) {
      Navigator.pop(context);
    }

    Navigator.popAndPushNamed(context, "/homefeed");
  }

  List<BottomNavigationBarItem> getNavBarItems() {
    return const [
      BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
      BottomNavigationBarItem(icon: Icon(Icons.people), label: "People"),
      BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
    ];
  }

  void navigateBottomBar(BuildContext context, int index) {
    switch (index) {
      case 0:
        {
          Navigator.popAndPushNamed(context, "/homefeed");
        }
      case 1:
        {
          Navigator.popAndPushNamed(context, "/profiledirectory");
        }
      case 2:
        {
          Navigator.popAndPushNamed(context, "/settings");
        }
    }
  }

  void addProfile(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => AddProfile()));
  }

  void editProfile(BuildContext context, BirthdayProfile profile) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => EditProfile(profile)));
  }
}
