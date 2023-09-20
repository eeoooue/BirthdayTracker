import 'package:flutter/material.dart';
import '../models/birthdayprofile.dart';
import '../widgets/profileelements.dart';

class ViewProfile extends StatefulWidget {
  final BirthdayProfile profile;

  const ViewProfile(this.profile, {super.key});

  @override
  State<StatefulWidget> createState() {
    return _ViewProfileState(profile);
  }
}

class _ViewProfileState extends State<ViewProfile> {
  final BirthdayProfile profile;

  _ViewProfileState(this.profile);

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
          "View Profile",
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
      body: Column(children: [
        ProfilePicture(profile),
        ProfileNameCard(profile),
        FormattedBirthdayWithBorder(profile),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            EditProfileButton(profile),
            DeleteProfileButton(profile),
          ],
        ),
      ]),
    );
  }
}
