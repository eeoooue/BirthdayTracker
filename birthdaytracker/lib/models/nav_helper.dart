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

  void addProfile(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const AddProfile()));
  }

  void editProfile(BuildContext context, BirthdayProfile profile) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => EditProfile(profile)));
  }

  BottomNavigationBar getBottomNav(Function(int) onTapFunction, int index) {
    return BottomNavigationBar(
        backgroundColor: const Color.fromRGBO(40, 30, 42, 1),
        selectedItemColor: Colors.white,
        unselectedItemColor: const Color.fromRGBO(145, 133, 145, 0.75),
        currentIndex: index,
        onTap: onTapFunction,
        items: getNavBarItems());
  }
}
