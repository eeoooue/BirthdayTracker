import 'package:flutter/material.dart';
import '../models/birthdayprofile.dart';
import '../widgets/profileelements.dart';

class AddProfile extends StatefulWidget {
  const AddProfile({super.key});

  @override
  State<StatefulWidget> createState() {
    return _AddProfileState();
  }
}

class _AddProfileState extends State<AddProfile> {
  _AddProfileState();

  void _navigateBottomBar(int index) {
    if (Navigator.canPop(context)) {
      Navigator.pop(context);
    }

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add Profile",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      bottomNavigationBar:
          BottomNavigationBar(onTap: _navigateBottomBar, items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.people), label: "People"),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
      ]),
      body: Column(),
    );
  }
}
