import 'package:birthdaytracker/models/birthdayprofile.dart';
import 'package:birthdaytracker/pages/edit_profile.dart';
import 'package:flutter/material.dart';
import '../pages/addprofile.dart';

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

  void addProfile(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => AddProfile()));
  }

  void editProfile(BuildContext context, BirthdayProfile profile) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => EditProfile(profile)));
  }
}
