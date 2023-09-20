import 'package:flutter/material.dart';

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
}
