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

  BottomNavigationBar getBottomNav(Function(int) onTapFunction, int index) {
    return BottomNavigationBar(
        backgroundColor: const Color.fromRGBO(40, 30, 42, 1),
        selectedItemColor: const Color.fromRGBO(155, 80, 148, 1),
        // selectedItemColor: const Color.fromRGBO(168, 158, 168, 1),
        unselectedItemColor: const Color.fromRGBO(0, 0, 0, 0.9),
        currentIndex: index,
        onTap: onTapFunction,
        items: getNavBarItems());
  }
}
